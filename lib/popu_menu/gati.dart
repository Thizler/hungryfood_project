import 'package:flutter/material.dart';

class GatiPage extends StatelessWidget {
  void _showGatiRecipeDialog(
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
            'เมนูกะทิ',
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
              buildGatiRecipeCard(
                context,
                "แกงเขียวหวานไก่",
                "assets/gati/1.png",
                "แกงเขียวหวานไก่หอมมันกะทิ",
                "1. เตรียมเครื่องแกงเขียวหวาน\n2. ผัดเครื่องแกงกับกะทิ\n3. ใส่ไก่และผัก\n4. ต้มจนสุกและเสิร์ฟพร้อมข้าวสวย",
              ),
              SizedBox(height: 20),
              buildGatiRecipeCard(
                context,
                "ขนมถ้วย",
                "assets/gati/2.png",
                "ขนมถ้วยหอมหวานมันกะทิ",
                "1. ผสมแป้งและน้ำตาล\n2. เทส่วนผสมลงในถ้วย\n3. นึ่งจนสุกและเสิร์ฟ",
              ),
              SizedBox(height: 20),
              buildGatiRecipeCard(
                context,
                "ต้มข่าไก่",
                "assets/gati/3.png",
                "ต้มข่าไก่รสชาติกลมกล่อม",
                "1. ต้มน้ำกะทิ\n2. ใส่ไก่และเครื่องปรุง\n3. ต้มจนสุกและเสิร์ฟร้อน ๆ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGatiRecipeCard(
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
                _showGatiRecipeDialog(context, title, recipeDetails);
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
