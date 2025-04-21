class CartItem {
  final String title;
  final String description;
  final String imagePath;
  final int price;
  int quantity; // เพิ่มจำนวนสินค้า

  CartItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    this.quantity = 1, // ค่าเริ่มต้นคือ 1
  });

  // เพิ่มเมธอดนี้
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
      price: json['price'],
      quantity: json['quantity'] ?? 1,
    );
  }

  // เพิ่มเมธอดนี้
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'quantity': quantity,
    };
  }
}
