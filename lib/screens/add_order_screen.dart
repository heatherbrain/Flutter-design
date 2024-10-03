import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FB),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:
            const Text('Tambah Order', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  fillColor: Colors.grey[50],
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  hintText: 'Cari produk',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.filter_list, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kategori Member',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerRight,
                  ),
                  child: Row(
                    children: [
                      Text('Pilih Member', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ProductItem(
                    title: 'Pendek 30\'s (New)',
                    stock: 645,
                  ),
                  ProductItem(
                    title: 'Pendek 24\'s (New)',
                    stock: 445,
                  ),
                  ProductItem(
                    title: 'Polos shirt',
                    stock: 5,
                    isLowStock: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final int stock;
  final bool isLowStock;

  ProductItem({
    required this.title,
    required this.stock,
    this.isLowStock = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: false,
                onChanged: (bool? value) {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.grey.shade200, // Placeholder for the image
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Stok: ${isLowStock ? "Tersisa " : ""}$stock',
                    style: TextStyle(
                      fontSize: 12,
                      color: isLowStock ? Colors.red : Colors.grey,
                      fontWeight: isLowStock ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildDropdown('Pilih warna dan size'),
                const SizedBox(height: 4),
                _buildDropdown('Sablon'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(hint, style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
