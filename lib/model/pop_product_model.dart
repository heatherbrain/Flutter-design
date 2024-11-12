// pop_product.dart

class PopProduct {
  final String name;
  final String imageUrl;
  final String size;
  final double price;

  PopProduct({
    required this.name,
    required this.imageUrl,
    required this.size,
    required this.price,
  });

  static List<PopProduct> products = [
    PopProduct(
      name: 'Pendek 30\'s (New)',
      imageUrl: 'assets/images/produk1.png',
      size: 'Hitam XL',
      price: 50.0,
    ),
    PopProduct(
      name: 'Pendek 30\'s (New)',
      imageUrl: 'assets/images/produk2.png',
      size: 'Hitam L',
      price: 55.0,
    ),
    PopProduct(
      name: 'Pendek 30\'s (New)',
      imageUrl: 'assets/images/produk3.png',
      size: 'Maroon M',
      price: 60.0,
    ),
  ];
}
