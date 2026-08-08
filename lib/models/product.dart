class Product {
  const Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    required this.oldPrice,
  });

  final int id;
  final String name;
  final String unit;
  final double price;
  final double oldPrice;
}
