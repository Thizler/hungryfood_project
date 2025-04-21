import 'package:flutter/material.dart';

class ShrimpPage extends StatelessWidget {
  void _showShrimpRecipeDialog(
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
            'เมนูกุ้งแชบ๊วย',
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
              buildShrimpRecipeCard(
                context,
                "กุ้งอบวุ้นเส้น",
                "assets/shrimp/1.png",
                "กุ้งอบวุ้นเส้นหอม ๆ พร้อมเครื่องเทศ",
                "1. เตรียมวุ้นเส้นและกุ้ง\n2. ผัดเครื่องเทศและอบพร้อมวุ้นเส้น\n3. เสิร์ฟร้อน ๆ",
              ),
              SizedBox(height: 20),
              buildShrimpRecipeCard(
                context,
                "กุ้งทอดกระเทียม",
                "assets/shrimp/2.png",
                "กุ้งทอดกระเทียมหอม ๆ กรอบอร่อย",
                "1. หมักกุ้งกับเครื่องปรุง\n2. ทอดกุ้งพร้อมกระเทียม\n3. เสิร์ฟพร้อมข้าวสวย",
              ),
              SizedBox(height: 20),
              buildShrimpRecipeCard(
                context,
                "ต้มยำกุ้ง",
                "assets/shrimp/3.png",
                "ต้มยำกุ้งรสจัดจ้าน หอมสมุนไพร",
                "1. ต้มน้ำซุปพร้อมเครื่องต้มยำ\n2. ใส่กุ้งและปรุงรส\n3. เสิร์ฟร้อน ๆ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShrimpRecipeCard(
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
                _showShrimpRecipeDialog(context, title, recipeDetails);
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
