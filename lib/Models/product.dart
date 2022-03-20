class Product {
  final String id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
  });

  @override
  String toString() {
    return id +
        ',' +
        title +
        ',' +
        description +
        ',' +
        category +
        ',' +
        price.toString() +
        ',' +
        image +
        '\n';
  }
}
