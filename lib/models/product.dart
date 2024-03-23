class Product {
  final int id;
  final String imageUrl;
  final String name;
  final int price;
  final String desc;
  bool isFavorite;

  Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.desc,
    required this.isFavorite,
  });
}
