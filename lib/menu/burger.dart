import 'package:flutter/material.dart';
import '../settingapp/settingapp.dart';
import '../delivery/burger/เบอร์เกอร์ไก่กรอบ.dart';
import '../delivery/burger/เบอร์เกอร์ชีสลาวา.dart';
import '../delivery/burger/เบอร์เกอร์หมู.dart';

class BurgerPage extends StatelessWidget {
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
            // เพิ่ม Center widget เพื่อจัดข้อความ title ให้อยู่ตรงกลาง
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
                      "เมนูเบอร์เกอร์",
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
                      "เบอร์เกอร์ชีสลาวา",
                      "assets/burger/1.png",
                      'คนรักเนื้อต้องว้าว! “เบอร์เกอร์ชีสลาวา" \n'
                          'เบอร์เกอร์โฮมเมดที่มีทั้งแพตตีเนื้อชุ่มฉ่ำ \n'
                          'สอดไส้ด้วยชีสมอสซาเรลลายืดสะใจ\n'
                          'และขนมปังบันเนื้อนุ่ม\n',
                      "1. นำเนื้อบดไปนวดเข้ากับชีส \nพร้อมปรุงเกลือพริกไทย\n2. นำขนมปังไปกริลกับเนยในกระทะ\n3.นำเนื้อลงไปกริลจนหอม \n4.นำผักและทุกอย่างมารวมและประกบกัน",
                    ),
                    SizedBox(height: 20),
                    buildRecipeRow(
                      context,
                      "เบอร์เกอร์ไก่กรอบ",
                      "assets/burger/2.png",
                      'เป็นไก่ทอดธรรมดาโลกไม่จำ! \n'
                          'เราขอเสนอเมนูสุดเอกซ์ตรีม“เบอร์เกอร์ไก่กรอบ” \n'
                          'เมนูไก่ทอดกรอบ ๆ\n'
                          'ประกบกันสองชั้นอะไรจะเกิดขึ้น!\n',
                      "1.ผสมเนื้อไก่กับแป้งทอดกรอบพร้อมปรุงรส\n2. ทอดไก่ให้สุกและนำมาพักรอไว้\n3. นำขนมปังไปกริลกับเนยในกระทะจนหอม\n4.นำผักและทุกอย่างมารวมและประกบกัน",
                    ),
                    SizedBox(height: 20),
                    buildRecipeRow(
                      context,
                      "เบอร์เกอร์หมู",
                      "assets/burger/3.png",
                      'จัดหนักกันให้สุด! กับเมนู\n'
                          '“เบอร์เกอร์หมู” \n',
                      "1. นำหมูบดมาปรุงรสและ ปั้นเป็นก้อนทำให้แบน\n2. นำลงไปทอดในกระทำ\n3. นำขนมปังไปกริลกับเนยในกระทะจนหอม\n4.นำผักและทุกอย่างมารวมและประกบกัน",
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
                        "เบอร์เกอร์ชีสลาวา",
                        "assets/burger/b1/3.webp",
                        'เบอร์เกอร์เนื้อชุ่มฉ่ำ สอดไส้ชีสเยิ้ม ๆ\n'
                            'เหมาะสำหรับคนรักชีสตัวจริง\n',
                        "1. ปรุงเนื้อและชีส\n2. ประกอบเบอร์เกอร์\n3. เสิร์ฟพร้อมซอสพิเศษ",
                        199, // ราคา
                      ),
                      SizedBox(height: 20),
                      buildRecipeRowWithPrice(
                        context,
                        "เบอร์เกอร์ไก่กรอบ",
                        "assets/burger/b2/4.png",
                        'สะโพกไก่ทอดกรอบ เสิร์ฟในขนมปังงา\n'
                            'พร้อมซอสสไปซี่มาโย\n',
                        "1. หมักไก่และทอดจนกรอบ\n2. ประกอบเบอร์เกอร์\n3. เสิร์ฟพร้อมซอส",
                        120, // ราคา
                      ),
                      SizedBox(height: 20),
                      buildRecipeRowWithPrice(
                        context,
                        "เบอร์เกอร์หมู",
                        "assets/burger/b3/2.jpg",
                        'เบอร์เกอร์หมูชิ้นโต ราดซอสสูตรพิเศษ\n'
                            'เสิร์ฟพร้อมผักสด\n',
                        "1. ปรุงหมูและทอดจนสุก\n2. ประกอบเบอร์เกอร์\n3. เสิร์ฟพร้อมซอส",
                        155, // ราคา
                      ),
                      SizedBox(height: 20),
                      buildRecipeRowWithPrice(
                        context,
                        "เบอร์เกอร์ไก่กรอบ",
                        "assets/burger/b2/4.png",
                        'สะโพกไก่ชิ้นใหญ่ทอด กรุบกรอบด้วยเกล็ดบะหมี่กึ่งสำเร็จรูป\n'
                            'เสิร์ฟมาในรูปแบบเบอร์เกอร์ พร้อมกับกิมจิสลอว์\n',
                        "1. หมักไก่กับนมและเครื่องเทศ\n2. คลุกแป้งทอดและเกล็ดบะหมี่\n3. ทอดจนกรอบและประกอบเบอร์เกอร์",
                        150, // ราคา
                      ),
                      SizedBox(height: 20),
                      buildRecipeRowWithPrice(
                        context,
                        "พาสต้าซอสงา",
                        "assets/pasta/shop/p1/1.png",
                        'พาสต้าซอสงาหอมมัน เสิร์ฟพร้อมหมูชาชูชิ้นโต\n'
                            'นุ่มละลายในปาก\n',
                        "1. ต้มเส้นพาสต้าจนสุก\n2. คลุกเคล้ากับซอสงา\n3. เสิร์ฟพร้อมหมูชาชู",
                        280, // ราคา
                      ),
                      SizedBox(height: 20),
                      buildRecipeRowWithPrice(
                        context,
                        "ข้าวหน้าหมูแดง",
                        "assets/rice/shop/r3/1.png",
                        'หมูแดงย่างเตาถ่าน หอมกลิ่นควันอ่อน ๆ\n'
                            'ราดด้วยน้ำซอสสูตรลับเข้มข้น\n',
                        "1. ย่างหมูแดงจนสุก\n2. หั่นเป็นชิ้นบาง ๆ\n3. ราดน้ำซอสและเสิร์ฟพร้อมข้าว",
                        50, // ราคา
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
                    if (title == "เบอร์เกอร์ไก่กรอบ") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChickenBurgerDeliveryPage(),
                        ),
                      );
                    } else if (title == "เบอร์เกอร์ชีสลาวา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerLavaDeliveryPage(),
                        ),
                      );
                    } else if (title == "เบอร์เกอร์หมู") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerPorkDeliveryPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Delivery button pressed")),
                      );
                    }
                  }, // <<== ต้องมี comma ตรงนี้!
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
    int price, // เพิ่มพารามิเตอร์สำหรับราคา
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
              "ราคา: $price บาท", // แสดงราคาที่กำหนด
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
                    if (title == "เบอร์เกอร์ไก่กรอบ") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChickenBurgerDeliveryPage(),
                        ),
                      );
                    } else if (title == "เบอร์เกอร์ชีสลาวา") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerLavaDeliveryPage(),
                        ),
                      );
                    } else if (title == "เบอร์เกอร์หมู") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerPorkDeliveryPage(),
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
