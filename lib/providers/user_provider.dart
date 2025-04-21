import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _userId; // เก็บ userId ของผู้ใช้ที่ล็อกอินอยู่

  String? get userId => _userId;

  get username => null; // ให้เรียกใช้ userId ได้จากภายนอก

  // ฟังก์ชันนี้จะถูกเรียกเมื่อเริ่มต้นแอปเพื่อดึงข้อมูลผู้ใช้ที่ล็อกอินอยู่
  Future<void> initUser() async {
    final user = FirebaseAuth.instance.currentUser;
    _userId = user?.uid; // เก็บ userId ของผู้ใช้ที่ล็อกอิน
    notifyListeners();
  }

  // ฟังก์ชันออกจากระบบ
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut(); // ลงชื่อออกจากระบบ
    _userId = null; // ล้างข้อมูล userId
    notifyListeners();
  }

  // ฟังก์ชันนี้ใช้ในการตั้งค่า userId เมื่อผู้ใช้ล็อกอินหรือเริ่มต้นแอป
  void setUser(String userId) {
    _userId = userId; // ตั้งค่าผู้ใช้ที่ล็อกอิน
    notifyListeners();
  }
}
