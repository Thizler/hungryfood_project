import 'package:flutter/material.dart';
import 'package:project1_test/cart_page.dart';
import 'package:project1_test/favorite_page.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/cart_provider.dart';
import 'package:project1_test/models/cart_item.dart';
import 'package:project1_test/providers/favorite_provider.dart';

class CarbonaraDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("พาสต้าซอสคาร์โบนาร่า"),
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
                "La Bottega di Luca – สุขุมวิท 49",
                "assets/pasta/shop/p2/1.png",
                "เส้นพาสต้าทำสดวันต่อวัน ราดซอสคาร์โบนาร่าเข้มข้น หอมชีสพาร์เมซานแท้ๆ",
                "ราคา: 350 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "Big Mama Pizzeria – อโศก",
                "assets/pasta/shop/p2/2.png",
                "คาโบนาร่าสไตล์โฮมเมด ซอสหอมหวานกลมกล่อม เส้นเหนียวนุ่มทุกคำ",
                "ราคา: 250 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "Wholly Cow Restaurant & Wine Bar – สุขุมวิท 39",
                "assets/pasta/shop/p2/3.png",
                "คาโบนาร่าซอสข้น หอมชีสพาร์เมซาน ท็อปด้วยเบคอนกรอบ เคี้ยวเพลิน",
                "ราคา: 300 บาท",
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
