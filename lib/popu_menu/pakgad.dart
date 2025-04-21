import 'package:flutter/material.dart';

class PakgadPage extends StatelessWidget {
  void _showPakgadRecipeDialog(
      BuildContext context, String title, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(details),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("ปิด"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'เมนูผักกาดหอม',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFFFF9D9D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildPakgadRecipeCard(
                context,
                "สลัดผักกาดหอม",
                "assets/pakgad/1.png",
                "สลัดผักกาดหอมสดใหม่ พร้อมน้ำสลัดโฮมเมด",
                "1. ล้างผักกาดหอมให้สะอาด\n2. คลุกเคล้ากับน้ำสลัด\n3. เสิร์ฟพร้อมขนมปังกรอบ",
              ),
              SizedBox(height: 20),
              buildPakgadRecipeCard(
                context,
                "ผัดผักกาดหอม",
                "assets/pakgad/2.png",
                "ผัดผักกาดหอมกรอบ ๆ หอมกลิ่นกระเทียม",
                "1. ล้างผักกาดหอม\n2. ผัดกับกระเทียมและซอสปรุงรส\n3. เสิร์ฟร้อน ๆ",
              ),
              SizedBox(height: 20),
              buildPakgadRecipeCard(
                context,
                "ซุปผักกาดหอม",
                "assets/pakgad/3.png",
                "ซุปผักกาดหอมร้อน ๆ หอมกลิ่นสมุนไพร",
                "1. ต้มน้ำซุป\n2. ใส่ผักกาดหอมและปรุงรส\n3. เสิร์ฟร้อน ๆ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPakgadRecipeCard(
    BuildContext context,
    String title,
    String imagePath,
    String description,
    String recipeDetails,
  ) {
    return Card(
      elevation: 4.0,
      color: Color(0xfffff0f0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showPakgadRecipeDialog(context, title, recipeDetails);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF9D9D),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("ดูสูตรอาหาร"),
            ),
          ],
        ),
      ),
    );
  }
}
