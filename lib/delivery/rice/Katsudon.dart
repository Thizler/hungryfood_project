import 'package:flutter/material.dart';
import 'package:project1_test/cart_page.dart';
import 'package:project1_test/favorite_page.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/cart_provider.dart';
import 'package:project1_test/models/cart_item.dart';
import 'package:project1_test/providers/favorite_provider.dart';

class KatsudonDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข้าวหน้าหมูสไลซ์ราดไข่"),
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
                "ข้าวหน้าหมูสไลซ์ราดไข่ by Katsuya",
                "assets/rice/shop/r1/1.png",
                "หมูสไลซ์นุ่มๆ ผัดกับซอสสไตล์ญี่ปุ่น เสิร์ฟบนข้าวญี่ปุ่นร้อนๆ และราดด้วยไข่เยิ้มๆ",
                "ราคา: 169 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "ข้าวหน้าด้งรสเผ็ดราดไข่ออนเซน (ขนาด L) By ดงบุริ เดอะซีรีส์ (Donburi The Series)",
                "assets/rice/shop/r1/2.png",
                "ข้าวหน้าด้งเนื้อสัตว์สไลด์บางๆ รสเผ็ด เสิร์ฟร้อนๆ คู่กับไข่ออนเซนเยิ้มๆ",
                "ราคา: 148 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "เซตข้าวหน้าหมูชุบแป้งทอด Yayoi Japanese Restaurant",
                "assets/rice/shop/r1/3.png",
                "เซตข้าวหน้าหมูชุบแป้งทอด ราดด้วยไข่สไตล์ญี่ปุ่น หอมๆนุ่มๆ กรอบนอกนุ่มใน",
                "ราคา: 169 บาท",
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
