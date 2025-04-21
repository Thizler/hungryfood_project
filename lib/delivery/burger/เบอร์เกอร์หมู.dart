import 'package:flutter/material.dart';
import 'package:project1_test/cart_page.dart';
import 'package:project1_test/favorite_page.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/cart_provider.dart';
import 'package:project1_test/models/cart_item.dart';
import 'package:project1_test/providers/favorite_provider.dart';

class BurgerPorkDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เบอร์เกอร์หมู"),
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
                "ชีสเบอร์เกอร์หมู by KRUA.CO",
                "assets/burger/b3/1.jpg",
                "เบอร์เกอร์หมูที่ผสมสมุนไพรฝรั่ง (พาสเลย์, โรสแมรี่), หอมใหญ่สับ, เกลือ, พริกไทย และผงกระเทียม เพิ่มไข่ไก่ให้นุ่มฉ่ำ ย่างให้หอม เสิร์ฟในขนมปังบริออชนุ่มหอมเนย พร้อมท็อปปิ้งผักสลัด, มะเขือเทศ, เบคอน, ชีส, หอมใหญ่ผัด และซอสกระเทียมคั่ว (Roasted garlic mayo) เข้ากันกับกลิ่นในพัทย์.",
                "ราคา: 155 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "คิดไรไม่ออก กินหมูกระทะ! Burger King เปิดตัวเบอร์เกอร์หมูกระทะ ดึงกลุ่มวัยรุ่นเข้าถึงง่ายขึ้น",
                "assets/burger/b3/2.jpg",
                "ไม่ต้องหัวเหม็นแล้ว! เบอร์เกอร์คิง เปิดตัวเมนูใหม่ “เบอร์เกอร์หมูกระทะ” หลังเจาะ customer insight พบคนไทยกลุ่มวัยรุ่น – คนทำงานเกี่ยวข้องกับหมูกระทะเป็นลำดับต้นๆ ของทุกโอกาสเฉลิมฉลอง พร้อมพัฒนาเมนูไทยซีรีย์เดิมให้ถูกปากมากขึ้น ผลตอบรับดียอดฐานสมาชิกโต 10%",
                "ราคา: 99 บาท",
              ),
              SizedBox(height: 20),
              buildDeliveryCard(
                context,
                "Anatomy Of a Burger ร้านเบอร์เกอร์สไตล์โฮมเมดเนื้อฉ่ำ เข้มข้นถึงใจ ",
                "assets/burger/b3/3.jpg",
                "เมนูแรกเอาใจสายเบคอนกันหน่อยกับ เบคอนห่อชีส เมนูนี้จะใช้เนื้อโปะแทนขนมปัง ฉ่ำมาก ! ไม่ถนัดขนมปัง ก็จัดเนื้อมาประกบแทนซะเลย เนื้อเน้น ๆ เครื่องแน่นจัดเต็ม ชีสทะลักจุใจ สายเนื้อต้องลอง",
                "ราคา: 189 บาท",
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
