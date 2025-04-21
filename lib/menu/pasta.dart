import 'package:flutter/material.dart';
import 'package:project1_test/delivery/pasta/BBQPasta.dart';
import 'package:project1_test/delivery/pasta/Carbonara.dart';
import 'package:project1_test/delivery/pasta/Sasame.dart';
import '../settingapp/settingapp.dart';

class PastaPage extends StatelessWidget {
  void _showRecipeDialog(BuildContext context, String title, String details) {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'RECIPE DETAILS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Color(0xFFFF9D9D),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Color(0xfffff0f0),
              child: TabBar(
                indicatorColor: Color(0xFFFF9D9D),
                labelColor: Color(0xFFFF9D9D),
                unselectedLabelColor: Color(0xFF3F3F3F),
                tabs: [
                  Tab(
                    child: Text(
                      "เมนูพาสต้า",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "สูตรอาหารอื่นๆ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildRecipeRow(
                      context,
                      "Sasame Pasta",
                      "assets/pasta/1.webp",
                      "เมนูอาหารคลีนสไตล์ญี่ปุ่นและอิตาลี เหมาะกับสายสุขภาพ!",
                      "1. ลวกเส้นพาสต้าโฮลวีต\n2. ทำซอสงาดำ\n3. ตอกไข่ลวกแล้วคลุกให้เข้ากัน",
                    ),
                    SizedBox(height: 20),
                    buildRecipeRow(
                      context,
                      "Carbonara Pasta",
                      "assets/pasta/2.jpg",
                      "เมนูเส้นสุดคลาสสิก มาพร้อมเคล็ดลับทำไข่ออนเซ็นง่าย ๆ!",
                      "1. ต้มเส้นสปาเกตตี\n2. ผัดซอสครีม\n3. ตอกไข่ออนเซ็นด้านบน",
                    ),
                    SizedBox(height: 20),
                    buildRecipeRow(
                      context,
                      "Pasta BBQ Sause",
                      "assets/pasta/3.webp",
                      "เมนูเส้นผัดซอสบาร์บีคิวสุดเข้มข้น อร่อยจัดจ้าน!",
                      "1. ผัดเส้นกับซอสบาร์บีคิว\n2. เติมเครื่องเทศ\n3. เสิร์ฟร้อน ๆ พร้อมเนื้อย่าง",
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      buildRecipeRowWithPrice(
                        context,
                        "พาสต้าซอสบาร์บีคิว",
                        "assets/pasta/shop/p3/1.png",
                        'พาสต้าซอสบาร์บีคิวรสชาติเข้มข้น\n'
                            'เสิร์ฟพร้อมเนื้อย่างนุ่ม ๆ\n',
                        "1. ต้มเส้นพาสต้าจนสุก\n2. ผัดซอสบาร์บีคิวจนหอม\n3. คลุกเส้นกับซอสและเนื้อย่าง",
                        250, // ราคา
                      ),
                      SizedBox(height: 20),
                      buildRecipeRowWithPrice(
                        context,
                        "พาสต้าซอสงา",
                        "assets/pasta/shop/p1/1.png",
                        'พาสต้าซอสงาหอมมัน\n'
                            'เสิร์ฟพร้อมหมูชาชูชิ้นโต\n',
                        "1. ต้มเส้นพาสต้าจนสุก\n2. คลุกเคล้ากับซอสงา\n3. เสิร์ฟพร้อมหมูชาชู",
                        200, // ราคา
                      ),
                      SizedBox(height: 20),
                      buildRecipeRowWithPrice(
                        context,
                        "พาสต้าคาโบนารา",
                        "assets/pasta/shop/p2/1.png",
                        'พาสต้าคาโบนาราสุดคลาสสิก\n'
                            'เสิร์ฟพร้อมซอสครีมเข้มข้นและเบคอนกรอบ\n',
                        "1. ต้มเส้นพาสต้าจนสุก\n2. ผัดซอสครีมกับเบคอน\n3. คลุกเส้นกับซอสและเสิร์ฟร้อน ๆ",
                        180, // ราคา
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeRow(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showRecipeDialog(context, title, recipeDetails);
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
                ElevatedButton(
                  onPressed: () {
                    if (title == "Sasame Pasta") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SasameDeliveryPage(),
                        ),
                      );
                    } else if (title == "Carbonara Pasta") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarbonaraDeliveryPage(),
                        ),
                      );
                    } else if (title == "Pasta BBQ Sause") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BBQPastaDeliveryPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Delivery button pressed")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3F3F3F),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("สั่งซื้อ"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeRowWithPrice(
    BuildContext context,
    String title,
    String imagePath,
    String description,
    String recipeDetails,
    int price,
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
            Text("ราคา: ฿$price", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showRecipeDialog(context, title, recipeDetails);
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
                ElevatedButton(
                  onPressed: () {
                    if (title == "พาสต้าคาโบนารา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarbonaraDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าซอสงา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SasameDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าซอสบาร์บีคิว") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BBQPastaDeliveryPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Delivery button pressed")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3F3F3F),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("สั่งซื้อ"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
