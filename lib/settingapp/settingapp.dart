import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1_test/login.dart';

class SettingApp extends StatefulWidget {
  @override
  _SettingAppState createState() => _SettingAppState();
}

class _SettingAppState extends State<SettingApp> {
  bool _isLoading = false;
  String _userName = '';
  String _firstName = '';
  String _lastName = '';
  String _phone = '';
  String _email = '';
  String _address = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // โหลดข้อมูลผู้ใช้จาก Firestore
  Future<void> _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      setState(() {
        _isLoading = true;
      });
      try {
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        final data = doc.data();
        if (data != null) {
          setState(() {
            _firstName = data['first_name'] ?? '';
            _lastName = data['last_name'] ?? '';
            _phone = data['phone'] ?? '';
            _address = data['address'] ?? '';
            _userName = _firstName + ' ' + _lastName; // รวมชื่อจริงและนามสกุล
          });
        }
        // ดึงอีเมลจาก FirebaseAuth
        _email = FirebaseAuth.instance.currentUser?.email ?? '';
      } catch (e) {
        print('Error loading user data: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("ไม่สามารถโหลดข้อมูลผู้ใช้ได้")),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // ฟังก์ชันออกจากระบบ
  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ตั้งค่า',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Color(0xFFFF9D9D),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // แสดงไอคอน user และชื่อผู้ใช้
              CircleAvatar(
                radius: 70,
                backgroundColor: Color(0xFFFF9D9D),
                child:
                    Icon(Icons.account_circle, size: 100, color: Colors.white),
              ),
              SizedBox(height: 20),

              // แสดงชื่อผู้ใช้
              Text(
                _userName,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 10),

              // แสดงอีเมล
              Text(
                _email,
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),

              // แสดงเบอร์โทร
              _phone.isEmpty ? Container() : _buildInfoRow('เบอร์โทร', _phone),
              SizedBox(height: 10),

              // แสดงที่อยู่
              _address.isEmpty
                  ? Container()
                  : _buildInfoRow('ที่อยู่', _address),
              SizedBox(height: 30),

              // ปุ่มออกจากระบบ
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => _signOut(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "ออกจากระบบ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างแถวสำหรับข้อมูลที่อยู่หรือเบอร์โทร
  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          label == 'เบอร์โทร' ? Icons.phone : Icons.home,
          color: Color(0xFFFF9D9D),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.black),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
