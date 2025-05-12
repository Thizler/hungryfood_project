import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // ใช้สำหรับสร้าง ID ที่ไม่ซ้ำกัน
import '../models/cart_item.dart';
import 'package:provider/provider.dart'; // เพิ่ม import สำหรับ Provider
import 'package:firebase_auth/firebase_auth.dart'; // เพิ่ม import สำหรับ FirebaseAuth

class CartProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _currentUser;
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // โหลดข้อมูลตะกร้าจาก Firestore
  Future<void> loadCart() async {
    if (_currentUser == null) {
      print("Error: _currentUser is null");
      return;
    }

    try {
      final cartSnapshot = await _firestore
          .collection('users')
          .doc(_currentUser)
          .collection('cart')
          .get();

      _items.clear();
      for (var doc in cartSnapshot.docs) {
        _items.add(CartItem.fromJson(doc.data()));
      }
      print("Cart loaded successfully for user $_currentUser");
      notifyListeners();
    } catch (e) {
      print("Error loading cart: $e");
    }
  }

  // บันทึกรายการเดี่ยวลง Firestore พร้อม Document ID
  Future<void> _saveItemToFirestore(CartItem item, String docId) async {
    if (_currentUser == null) {
      print("Error: _currentUser is null");
      return;
    }
    try {
      print("Saving item to Firestore: ${item.title}");
      await _firestore
          .collection('users')
          .doc(_currentUser)
          .collection('cart')
          .doc(docId)
          .set(item.toJson());
      print("Item saved successfully: ${item.title}");
    } catch (e) {
      print("Error saving item to Firestore: $e");
    }
  }

  // ลบรายการเดี่ยวจาก Firestore
  Future<void> _removeItemFromFirestore(String docId) async {
    if (_currentUser == null) {
      print("Error: _currentUser is null");
      return;
    }
    try {
      await _firestore
          .collection('users')
          .doc(_currentUser)
          .collection('cart')
          .doc(docId)
          .delete();
    } catch (e) {
      print("Error removing item from Firestore: $e");
    }
  }

  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }

    // สร้าง Document ID ที่ไม่ซ้ำกัน
    final docId = Uuid().v4(); // ใช้ UUID สำหรับสร้าง ID

    _saveItemToFirestore(item, docId);
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      _items[index].quantity++;
      _saveItemToFirestore(_items[index], _items[index].title);
      notifyListeners();
    }
  }

  void decrementQuantity(CartItem item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
        _saveItemToFirestore(_items[index], _items[index].title);
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
    if (_currentUser == null) {
      print("Error: _currentUser is null");
      return;
    }
    try {
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
    } catch (e) {
      print("Error clearing cart: $e");
    }
  }

  Future<void> setUser(String userId) async {
    _currentUser = userId;
    print("CartProvider: set user $_currentUser");
    await loadCart();
  }
}

// ตัวอย่างการใช้งาน CartProvider
void addSampleItem(BuildContext context) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    print("Error: User is not logged in.");
    return;
  }

  print("Current User UID: ${currentUser.uid}");

  await Provider.of<CartProvider>(context, listen: false)
      .setUser(currentUser.uid);

  final cartProvider = Provider.of<CartProvider>(context, listen: false);
  cartProvider.addItem(CartItem(
    title: "Spaghetti Carbonara",
    description: "Delicious creamy pasta",
    imagePath: "assets/images/carbonara.jpg",
    price: 250,
  ));
}
