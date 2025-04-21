import 'package:flutter/material.dart';

class MayongPage extends StatelessWidget {
  void _showMayongRecipeDialog(
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
            'เมนูมะยงชิด',
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
              buildMayongRecipeCard(
                context,
                "น้ำมะยงชิดปั่น",
                "assets/mayong/1.png",
                "น้ำมะยงชิดปั่นสดชื่น หวานอมเปรี้ยว",
                "1. ปอกเปลือกมะยงชิด\n2. ปั่นพร้อมน้ำแข็งและน้ำเชื่อม\n3. เสิร์ฟเย็น ๆ",
              ),
              SizedBox(height: 20),
              buildMayongRecipeCard(
                context,
                "มะยงชิดลอยแก้ว",
                "assets/mayong/2.png",
                "มะยงชิดลอยแก้วหวานเย็นชื่นใจ",
                "1. ปอกเปลือกมะยงชิด\n2. แช่ในน้ำเชื่อมเย็น\n3. เสิร์ฟพร้อมน้ำแข็ง",
              ),
              SizedBox(height: 20),
              buildMayongRecipeCard(
                context,
                "ไอศกรีมมะยงชิด",
                "assets/mayong/3.png",
                "ไอศกรีมมะยงชิดหอมหวาน",
                "1. ปั่นมะยงชิดพร้อมครีม\n2. แช่ในช่องฟรีซจนแข็ง\n3. ตักเสิร์ฟพร้อมผลไม้สด",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMayongRecipeCard(
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
                _showMayongRecipeDialog(context, title, recipeDetails);
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
