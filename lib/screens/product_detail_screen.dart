import 'package:flutter/material.dart';
import 'package:from_design/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Warna: ${product.color}',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              'Stok: ${product.stock}',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi Produk',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Ini adalah deskripsi produk. Berikan informasi detail tentang produk di sini.',
              style: TextStyle(fontSize: 14),
            ),
            // Add more product details as needed
          ],
        ),
      ),
    );
  }
}
