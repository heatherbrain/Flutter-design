import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockadjScreen extends StatefulWidget {
  const StockadjScreen({super.key});

  @override
  _StockadjScreenState createState() => _StockadjScreenState();
}

class _StockadjScreenState extends State<StockadjScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Stok Adj', style: TextStyle(color: Colors.black)),
        elevation: 0,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  Expanded(child: _buildProductList()),
                ],
              ),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
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
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF74904),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.filter_list, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: const [
        ProductItem(
          title: 'Pendek 30\'s (New)',
          stock: 645,
          warna: 'Merah',
          imageUrl: 'assets/images/order1.png',
        ),
        ProductItem(
          title: 'Pendek 24\'s (New)',
          stock: 445,
          warna: 'Biru',
          imageUrl: 'assets/images/order2.png',
        ),
        ProductItem(
          title: 'Polos shirt',
          stock: 5,
          warna: 'Orange',
          isLowStock: true,
          imageUrl: 'assets/images/order3.png',
        ),
        ProductItem(
          title: 'Oversize 24s',
          stock: 123,
          warna: 'Hijau',
          imageUrl: 'assets/images/order4.png',
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 27.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 7.0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: const Text(
                'Sesuaikan (0)',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final String title;
  final int stock;
  final String warna;
  final String imageUrl;
  final bool isLowStock;

  const ProductItem({
    super.key,
    required this.title,
    required this.stock,
    required this.warna,
    required this.imageUrl,
    this.isLowStock = false,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            widget.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Warna: ${widget.warna}'),
                Text('Stok: ${widget.stock}'),
              ],
            ),
          ),
          Checkbox(
  value: _isChecked,
  onChanged: (bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  },
  activeColor: Color(0xFFF74904), 
),

        ],
      ),
    );
  }
}
