class Order {
  final String assetPath;
  final String name;
  final String orderId;
  final String date;
  final String total;
  final String productsCount;
  final String statusLabel1;
  final String statusLabel2;

  Order({
    required this.assetPath,
    required this.name,
    required this.orderId,
    required this.date,
    required this.total,
    required this.productsCount,
    required this.statusLabel1,
    required this.statusLabel2,
  });
}
