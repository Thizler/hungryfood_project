import 'package:flutter/material.dart';

class TomatoPage extends StatelessWidget {
  void _showTomatoRecipeDialog(
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
            'เมนูมะเขือเทศเชอร์รี่',
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
              buildTomatoRecipeCard(
                context,
                "ซุปมะเขือเทศ",
                "assets/tomato/1.png",
                "ซุปมะเขือเทศร้อน ๆ หอมกลิ่นสมุนไพร",
                "1. ปั่นมะเขือเทศ\n2. ต้มพร้อมครีมและเครื่องเทศ\n3. เสิร์ฟร้อน ๆ",
              ),
              SizedBox(height: 20),
              buildTomatoRecipeCard(
                context,
                "สลัดมะเขือเทศ",
                "assets/tomato/2.png",
                "สลัดมะเขือเทศสดใหม่ ราดน้ำมันมะกอก",
                "1. หั่นมะเขือเทศ\n2. คลุกเคล้ากับน้ำมันมะกอกและสมุนไพร\n3. เสิร์ฟสด ๆ",
              ),
              SizedBox(height: 20),
              buildTomatoRecipeCard(
                context,
                "พาสต้ามะเขือเทศ",
                "assets/tomato/3.png",
                "พาสต้ามะเขือเทศรสชาติกลมกล่อม",
                "1. ต้มพาสต้า\n2. ผัดซอสมะเขือเทศ\n3. คลุกเคล้ากับพาสต้าและเสิร์ฟ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTomatoRecipeCard(
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
                _showTomatoRecipeDialog(context, title, recipeDetails);
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
