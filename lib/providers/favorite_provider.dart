import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _currentUser;
  List<Map<String, String>> _favoriteItems = [];

  List<Map<String, String>> get favoriteItems => _favoriteItems;

  // โหลดข้อมูลรายการโปรดของผู้ใช้จาก Firestore
  Future<void> loadFavorites() async {
    if (_currentUser == null) return;

    try {
      final favSnapshot = await _firestore
          .collection('users')
          .doc(_currentUser)
          .collection('favorites')
          .get();

      _favoriteItems.clear();
      for (var doc in favSnapshot.docs) {
        _favoriteItems.add(Map<String, String>.from(doc.data()));
      }
      notifyListeners();
    } catch (e) {
      print('Error loading favorites: $e');
      // Handle error (show an error message or log it)
    }
  }

  // บันทึกข้อมูลรายการโปรดของผู้ใช้ลง Firestore
  Future<void> saveFavorites() async {
    if (_currentUser == null) return;

    try {
      final batch = _firestore.batch();

      // ลบข้อมูลเก่าของรายการโปรด
      final favSnapshot = await _firestore
          .collection('users')
          .doc(_currentUser)
          .collection('favorites')
          .get();
      for (var doc in favSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // เพิ่มข้อมูลรายการโปรดใหม่ลง Firestore
      for (var item in _favoriteItems) {
        final favoriteItemRef = _firestore
            .collection('users')
            .doc(_currentUser)
            .collection('favorites')
            .doc(); // สร้างเอกสารใหม่สำหรับแต่ละรายการโปรด
        batch.set(favoriteItemRef, item);
      }

      await batch.commit();
      notifyListeners();
    } catch (e) {
      print('Error saving favorites: $e');
      // Handle error (show an error message or log it)
    }
  }

  // ฟังก์ชันการเพิ่มรายการโปรด
  Future<void> addFavorite(Map<String, String> item) async {
    _favoriteItems.add(item);
    await saveFavorites(); // Wait for save to complete
    notifyListeners();
  }

  // ฟังก์ชันการลบรายการโปรด
  Future<void> removeFavorite(Map<String, String> item) async {
    _favoriteItems.removeWhere((element) => element['title'] == item['title']);
    await saveFavorites(); // Wait for save to complete
    notifyListeners();
  }

  // ฟังก์ชันตรวจสอบว่ามีรายการโปรดหรือไม่
  bool isFavorite(String title) {
    return _favoriteItems.any((item) => item['title'] == title);
  }

  // ฟังก์ชันการตั้งค่าผู้ใช้ที่เข้าสู่ระบบ
Future<void> setUser(String userId) async {
    _currentUser = userId;
    print("FavoriteProvider: set user $_currentUser");
    await loadFavorites();
  }
}
