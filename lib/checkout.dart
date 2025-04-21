import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/cart_provider.dart';

class CheckoutPage extends StatefulWidget {
  final int total;

  CheckoutPage({required this.total});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _couponController = TextEditingController();
  String _couponMessage = "";
  double _discountedTotal = 0.0;
  bool _isCouponApplied = false; // ตัวแปรสำหรับตรวจสอบว่ามีการใช้คูปองหรือไม่

  @override
  void initState() {
    super.initState();
    _discountedTotal = widget.total.toDouble(); // กำหนดราคาตั้งต้น
  }

  void _applyCoupon() {
    setState(() {
      if (_couponController.text == "DISCOUNT10") {
        _discountedTotal = widget.total * 0.9; // ลดราคา 10%
        _couponMessage = "Coupon applied! You got 10% off.";
        _isCouponApplied = true; // ตั้งค่าให้รู้ว่ามีการใช้คูปอง
      } else {
        _discountedTotal = widget.total.toDouble(); // คืนค่าราคาเดิม
        _couponMessage = "Invalid coupon code.";
        _isCouponApplied = false; // ไม่มีการใช้คูปอง
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Color(0xFFFF9D9D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Amount",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "${_discountedTotal.toStringAsFixed(2)} Baht",
              style: TextStyle(fontSize: 32, color: Colors.green),
            ),
            if (_isCouponApplied) // แสดง Label เมื่อมีการใช้คูปอง
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Coupon applied: 10% discount",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Apply Coupon',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _couponController,
                      decoration: InputDecoration(
                        hintText: 'Enter your coupon code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _applyCoupon,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF9D9D),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Text("Apply"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              _couponMessage,
              style: TextStyle(
                fontSize: 16,
                color: _couponMessage.contains("Invalid")
                    ? Colors.red
                    : Colors.green,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // ลบรายการทั้งหมดใน Cart
                cartProvider.clearCart();

                // แสดงข้อความยืนยัน
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Payment Successful!")),
                );

                // กลับไปยังหน้า Home
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF9D9D),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text("Confirm Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
