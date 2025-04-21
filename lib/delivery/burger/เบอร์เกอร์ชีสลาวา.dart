import 'package:flutter/material.dart';
import 'package:project1_test/cart_page.dart';
import 'package:project1_test/favorite_page.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/cart_provider.dart';
import 'package:project1_test/models/cart_item.dart';
import 'package:project1_test/providers/favorite_provider.dart';

class BurgerLavaDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เบอร์เกอร์ชีสลาวา"),
        backgroundColor: Color(0xFFFF9D9D),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildDeliveryCard(
                context,
                "Kitchen Culture: Java Lava Burger by Hard Rock Cafe",
                "assets/burger/b1/1.png",
                "Hard Rock Cafe Chiang Mai ได้หยิบยกเมนูที่มีเรื่องราวประวัติศาสตร์อันยาวนานมาสร้างสรรค์ให้เกิดรสชาติชวนน่าลิ้มลองในชื่อว่า Java Lava Burger",
                "ราคา: 269 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "ชีสเบอร์เกอร์กับช็อกโกแลต by KRUA.CO",
                "assets/burger/b1/2.jpg",
                "ชีสเบอร์เกอร์สูตรนี้มีความพิเศษตรงที่ นำหอมแดงมาผัดกับเบคอนและเห็ด ใส่ไวน์ขาวเล็กน้อย หรือจะใส่ไวน์แดงก็ได้ ผัดให้เป็นสีน้ำตาลนิดๆ ปรุงรสด้วยเกลือและพริไทยนิดหน่อย ก่อนที่จะใส่ดาร์ช็อกโกแลตลงไป เคล้าใก้ช็อกโกแลตละลายเคลือบจนทั่ว กินคู่กับเบคอนย่าง",
                "ราคา: 199 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "ดีลส่วนลดพิเศษร้าน JIM's Burgers & Beers (จิมเบอร์เกอร์แอนด์เบียร์) Lava Cheesy Burger Beef เบอร์เกอร์เนื้อ ชีสเยิ้ม ๆ เกรดพรีเมียม สำหรับคนรักชีส ตัวจริง",
                "assets/burger/b1/3.webp",
                "เบอเกอร์สำหรับคนรักชีสโดยเฉพาะใส่ชีสมากกว่าปกติถึง 3 เท่า ใช้เชดด้าชีสสูตรพรีเมียม ราดบนเนื้อบด ปิดท้ายด้วยซอสสุดพรีเมียมสูตรพิเศษจากร้านจิมส์",
                "ราคา: 230 บาท",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDeliveryCard(
    BuildContext context,
    String title,
    String imagePath,
    String description,
    String price,
  ) {
    return Card(
      elevation: 4.0,
      color: Color(0xfffff0f0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
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
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(description, style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text(price, style: TextStyle(fontSize: 16, color: Colors.red)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                    cartProvider.addItem(CartItem(
                      title: title,
                      description: description,
                      imagePath: imagePath,
                      price: int.parse(price.replaceAll(RegExp(r'[^0-9]'), '')),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("เพิ่ม $title ไปยัง Cart")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF9D9D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("สั่งซื้อ"),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Consumer<FavoriteProvider>(
              builder: (context, favoriteProvider, child) {
                final isFavorite = favoriteProvider.isFavorite(title);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      favoriteProvider.removeFavorite({
                        'title': title,
                        'imagePath': imagePath,
                        'description': description,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("ลบ $title ออกจาก Favorite")),
                      );
                    } else {
                      favoriteProvider.addFavorite({
                        'title': title,
                        'imagePath': imagePath,
                        'description': description,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("เพิ่ม $title ไปยัง Favorite")),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
