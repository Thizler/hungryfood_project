import 'package:flutter/material.dart';
import 'package:project1_test/delivery/rice/BBQpork.dart';
import 'package:project1_test/delivery/rice/Gyudon.dart';
import 'package:project1_test/delivery/rice/Katsudon.dart';
import 'package:project1_test/delivery/pasta/BBQPasta.dart';
import 'package:project1_test/delivery/pasta/Sasame.dart';
import 'package:project1_test/delivery/pasta/Carbonara.dart';
import '../settingapp/settingapp.dart';

// นำเข้าไฟล์หน้าจัดการสั่งซื้อหากมี เช่น:
// import '../delivery/rice/rice_pork_egg.dart';

class RicePage extends StatelessWidget {
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
                      "เมนูข้าว",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "สูตรอาหารอื่นๆ",
                      style: TextStyle(fontSize: 20),
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
                      "Katsudon",
                      "assets/rice/1.png",
                      "เมนูอาหารญี่ปุ่นสไตล์เด็กหอ ทำง่ายแค่ 3 ขั้นตอน!",
                      "1. หั่นหมูสไลซ์บาง ๆ\n2. ใส่ไข่และปรุงรส\n3. ใช้ไมโครเวฟแล้วเสิร์ฟพร้อมข้าว",
                    ),
                    SizedBox(height: 20),
                    buildRecipeRow(
                      context,
                      "Gyudon",
                      "assets/rice/2.png",
                      "สวมวิญญาณเชฟอาหารญี่ปุ่น ทำข้าวหน้าเนื้อสุดฟิน!",
                      "1. หั่นเนื้อบาง ๆ\n2. นำไปผัดและปรุงรสด้วยซอส\n3. เสิร์ฟพร้อมข้าว",
                    ),
                    SizedBox(height: 20),
                    buildRecipeRow(
                      context,
                      "BBQ Pork",
                      "assets/rice/3.png",
                      "หมูแดงนุ่ม ๆ ชิ้นโต สูตรน้ำราดกลมกล่อม อร่อยสุด!",
                      "1. ย่างหมูแดงให้สุก\n2. หั่นเป็นชิ้นบางๆ\n3. ราดน้ำซอสแล้วเสิร์ฟ",
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
                    if (title == "Katsudon") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KatsudonDeliveryPage(),
                        ),
                      );
                    } else if (title == "Gyudon") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GyudonDeliveryPage(),
                        ),
                      );
                    } else if (title == "BBQ Pork") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BBQPorkDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าซอสบาร์บีคิว") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BBQPastaDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าซอสงา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SasameDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าคาโบนารา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarbonaraDeliveryPage(),
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
            Text(
              "ราคา: ฿$price",
              style: TextStyle(
                  fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
            ),
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
                    if (title == "Katsudon") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KatsudonDeliveryPage(),
                        ),
                      );
                    } else if (title == "Gyudon") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GyudonDeliveryPage(),
                        ),
                      );
                    } else if (title == "BBQ Pork") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BBQPorkDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าซอสบาร์บีคิว") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BBQPastaDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าซอสงา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SasameDeliveryPage(),
                        ),
                      );
                    } else if (title == "พาสต้าคาโบนารา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarbonaraDeliveryPage(),
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
