import 'package:flutter/material.dart';

class BaeguPage extends StatelessWidget {
  void _showBaeguRecipeDialog(
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
            'เมนูผักเหลียง',
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
              buildBaeguRecipeCard(
                context,
                "ผัดผักเหลียงไข่",
                "assets/baegu/1.png",
                "ผัดผักเหลียงไข่หอม ๆ รสชาติกลมกล่อม",
                "1. ล้างผักเหลียงให้สะอาด\n2. ผัดกับไข่และเครื่องปรุง\n3. เสิร์ฟร้อน ๆ",
              ),
              SizedBox(height: 20),
              buildBaeguRecipeCard(
                context,
                "แกงเลียงผักเหลียง",
                "assets/baegu/2.png",
                "แกงเลียงผักเหลียงร้อน ๆ หอมกลิ่นสมุนไพร",
                "1. ต้มน้ำแกงเลียง\n2. ใส่ผักเหลียงและเครื่องแกง\n3. เสิร์ฟพร้อมข้าวสวย",
              ),
              SizedBox(height: 20),
              buildBaeguRecipeCard(
                context,
                "ยำผักเหลียง",
                "assets/baegu/3.png",
                "ยำผักเหลียงรสจัดจ้าน",
                "1. ลวกผักเหลียง\n2. คลุกเคล้ากับน้ำยำ\n3. เสิร์ฟพร้อมเครื่องเคียง",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBaeguRecipeCard(
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
                _showBaeguRecipeDialog(context, title, recipeDetails);
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
