import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Items"),
        backgroundColor: Color(0xFFFF9D9D),
      ),
      body: favoriteProvider.favoriteItems.isEmpty
          ? Center(
              child: Text(
                "No items in Favorite",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: favoriteProvider.favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteProvider.favoriteItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      item['imagePath']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item['description']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        favoriteProvider.removeFavorite(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("${item['title']} removed from Favorite"),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
