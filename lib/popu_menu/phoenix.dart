import 'package:flutter/material.dart';

class PhoenixPage extends StatelessWidget {
  void _showPhoenixRecipeDialog(
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
            'เมนูปลาอินทรี',
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
              buildPhoenixRecipeCard(
                context,
                "ปลาอินทรีทอดน้ำปลา",
                "assets/phoenix/1.png",
                "ปลาอินทรีทอดกรอบ ราดน้ำปลาหอม ๆ",
                "1. ทอดปลาอินทรีจนกรอบ\n2. ราดน้ำปลาปรุงรส\n3. เสิร์ฟพร้อมข้าวสวย",
              ),
              SizedBox(height: 20),
              buildPhoenixRecipeCard(
                context,
                "แกงส้มปลาอินทรี",
                "assets/phoenix/2.png",
                "แกงส้มรสจัดจ้าน ใส่ปลาอินทรี",
                "1. ต้มน้ำแกงส้ม\n2. ใส่ปลาอินทรีและผัก\n3. ปรุงรสและเสิร์ฟ",
              ),
              SizedBox(height: 20),
              buildPhoenixRecipeCard(
                context,
                "ปลาอินทรีต้มซีอิ๊ว",
                "assets/phoenix/3.png",
                "ปลาอินทรีต้มซีอิ๊วหอมหวาน",
                "1. ต้มปลาอินทรีกับซีอิ๊ว\n2. ใส่ขิงและต้นหอม\n3. เสิร์ฟร้อน ๆ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhoenixRecipeCard(
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
                _showPhoenixRecipeDialog(context, title, recipeDetails);
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
