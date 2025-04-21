import 'package:flutter/material.dart';
import 'package:project1_test/cart_page.dart';
import 'package:project1_test/favorite_page.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/cart_provider.dart';
import 'package:project1_test/providers/favorite_provider.dart';
import 'package:project1_test/models/cart_item.dart';

class BBQPorkDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข้าวหมูแดง"),
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
                "ข้าวหมูแดงนครสนุก – ราชพฤกษ์",
                "assets/rice/shop/r3/1.png",
                "หมูแดงย่างเตาถ่าน หอมกลิ่นควันอ่อนๆ ราดด้วยน้ำซอสสูตรลับเข้มข้น กินกับไข่ต้มคือที่สุด!",
                "ราคา: 45 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "ข้าวหมูแดงนายไซ ประชาชื่น – ประชาชื่น",
                "assets/rice/shop/r3/2.png",
                "ตำนานกว่า 60 ปี หมูแดงเนื้อนุ่ม ชิ้นหนา น้ำราดหวานเค็มกลมกล่อม ติดใจตั้งแต่คำแรก!",
                "ราคา: 50 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "ข้าวหมูแดงสีมรกต – ซอยสุกร 1 (เยาวราช)",
                "assets/rice/shop/r3/3.png",
                "ข้าวหมูแดงในตำนาน หมูแดงนุ่มละลาย น้ำราดหอมเข้ม ไข่ต้มยางมะตูมคือไฮไลต์!",
                "ราคา: 50 บาท",
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
