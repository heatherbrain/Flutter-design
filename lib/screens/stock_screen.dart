import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Minimal Stok',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: _buildSearchBar(),
          ),
          Expanded(
            child: _buildProductList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari produk',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          suffixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.filter_list, color: Colors.white, size: 20),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: const [
        ProductItem(
          title: 'Panjang Anak 30\'s (New)',
          color: 'Hitam',
          size: 'S',
          stock: 45,
          minStock: 50,
          assetPath: 'assets/images/stok1.png',
        ),
        ProductItem(
          title: 'Panjang Anak 30\'s (New)',
          color: 'Hitam',
          size: 'M',
          stock: 40,
          minStock: 100,
          assetPath: 'assets/images/stok1.png',
        ),
        ProductItem(
          title: 'Panjang Anak 24\'s (New)',
          color: 'Navy',
          size: 'S',
          stock: 40,
          minStock: 100,
          assetPath: 'assets/images/stok2.png',
        ),
        ProductItem(
          title: 'Panjang Anak 24\'s (New)',
          color: 'Navy',
          size: 'M',
          stock: 40,
          minStock: 100,
          assetPath: 'assets/images/stok2.png',
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String color;
  final String size;
  final int stock;
  final int minStock;
  final String assetPath;

  const ProductItem({
    Key? key,
    required this.title,
    required this.color,
    required this.size,
    required this.stock,
    required this.minStock,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restockAmount = minStock - stock;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(assetPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: color == 'Hitam' ? Colors.black : Color(0xFF1E40AF),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(color,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(size,
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Stok: $stock',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 12)),
                    Container(
                      height: 15,
                      width: 1,
                      color: Colors.grey[300],
                    ),
                    Text('Min Stok: $minStock',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 12)),
                    Container(
                      height: 15,
                      width: 1,
                      color: Colors.grey[300],
                    ),
                    Text(
                      'Restok: ${restockAmount.abs()}',
                      style: TextStyle(
                        color: const Color(0xFFF74904),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
