import 'package:flutter/material.dart';
import '../settingapp/settingapp.dart';

class ChickenPage extends StatelessWidget {
  void _showChickenRecipeDialog(
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

  void _onSettingsPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'RECIPE DETAILS',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFFFF9D9D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF3F3F3F)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Color(0xFF3F3F3F)),
            onPressed: () => _onSettingsPressed(context),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: LayoutBuilder(
            // เพิ่ม LayoutBuilder
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  buildChickenRecipeCard(
                    context,
                    "ข้าวมันไก่",
                    "assets/chicken/1.webp",
                    "ข้าวมันไก่นุ่ม ๆ หอม ๆ พร้อมน้ำจิ้มรสเด็ด",
                    "1. ต้มไก่ให้สุก\n2. หุงข้าวกับน้ำซุปไก่\n3. สับไก่และเสิร์ฟพร้อมข้าวและน้ำจิ้ม",
                    constraints
                        .maxWidth, // ส่งความกว้างสูงสุดของหน้าจอไปยัง buildChickenRecipeCard
                  ),
                  SizedBox(height: 20),
                  buildChickenRecipeCard(
                    context,
                    "ข้าวไก่ทอด",
                    "assets/chicken/2.png",
                    "ไก่ทอดกรอบนอกนุ่มใน เสิร์ฟพร้อมข้าวสวยร้อน ๆ",
                    "1. หมักไก่กับเครื่องปรุง\n2. นำไก่ไปคลุกแป้งและทอด\n3. เสิร์ฟพร้อมข้าวและน้ำจิ้ม",
                    constraints
                        .maxWidth, // ส่งความกว้างสูงสุดของหน้าจอไปยัง buildChickenRecipeCard
                  ),
                  SizedBox(height: 20),
                  buildChickenRecipeCard(
                    context,
                    "ข้าวอบไก่",
                    "assets/chicken/3.jpg",
                    "ข้าวอบไก่หอม ๆ รสชาติกลมกล่อม",
                    "1. หมักไก่กับเครื่องปรุง\n2. นำไก่ไปอบพร้อมข้าว\n3. เสิร์ฟร้อน ๆ",
                    constraints
                        .maxWidth, // ส่งความกว้างสูงสุดของหน้าจอไปยัง buildChickenRecipeCard
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildChickenRecipeCard(
    BuildContext context,
    String title,
    String imagePath,
    String description,
    String recipeDetails,
    double maxWidth, // รับความกว้างสูงสุดของหน้าจอ
  ) {
    return SizedBox(
      width:
          maxWidth, // กำหนดความกว้างของการ์ดให้เท่ากับความกว้างสูงสุดของหน้าจอ
      child: Card(
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
                  _showChickenRecipeDialog(context, title, recipeDetails);
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
      ),
    );
  }
}
