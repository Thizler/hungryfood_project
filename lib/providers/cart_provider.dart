import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _currentUser;
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // โหลดข้อมูลตะกร้าจาก Firestore
  Future<void> loadCart() async {
    if (_currentUser == null) return;

    final cartSnapshot = await _firestore
        .collection('users')
        .doc(_currentUser)
        .collection('cart')
        .get();

    _items.clear();
    for (var doc in cartSnapshot.docs) {
      _items.add(CartItem.fromJson(doc.data()));
    }
    notifyListeners();
  }

  // บันทึกรายการเดี่ยวลง Firestore
  Future<void> _saveItemToFirestore(CartItem item) async {
    if (_currentUser == null) return;
    await _firestore
        .collection('users')
        .doc(_currentUser)
        .collection('cart')
        .doc(item.title) // ใช้ title เป็น docId
        .set(item.toJson());
  }

  // ลบรายการเดี่ยวจาก Firestore
  Future<void> _removeItemFromFirestore(String title) async {
    if (_currentUser == null) return;
    await _firestore
        .collection('users')
        .doc(_currentUser)
        .collection('cart')
        .doc(title)
        .delete();
  }

  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }
    _saveItemToFirestore(_items[index == -1 ? _items.length - 1 : index]);
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      _items[index].quantity++;
      _saveItemToFirestore(_items[index]);
      notifyListeners();
    }
  }

  void decrementQuantity(CartItem item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
        _saveItemToFirestore(_items[index]);
      } else {
        _removeItemFromFirestore(item.title);
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(CartItem item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      _removeItemFromFirestore(item.title);
      _items.removeAt(index);
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    if (_currentUser == null) return;
    final batch = _firestore.batch();

    final cartRef =
        _firestore.collection('users').doc(_currentUser).collection('cart');

    final snapshot = await cartRef.get();
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
    _items.clear();
    notifyListeners();
  }

Future<void> setUser(String userId) async {
    _currentUser = userId;
    print("CartProvider: set user $_currentUser");
    await loadCart();
  }

}
