class Product {
  final int? id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String imageUrl;
  final num? rating;
  final int count;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.imageUrl,
      required this.rating,
        required this.count
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['image'],
      rating: json['rating']['rate'],
      count: json['rating']['count'],
    );
  }
}
