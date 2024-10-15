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
                  Expanded(
                    child: _buildProductList(),
                  ),
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
          hintStyle: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w400),
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
              color: Colors.deepOrange,
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
      children: [
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
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return _buildBottomSheet();
          },
        );
      },
      child: Container(
        width: 328,
        height: 110,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
              activeColor: const Color(0xFFF74904),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Warna: ${widget.warna}',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        widget.isLowStock
                            ? 'Tersisa ${widget.stock}'
                            : 'Stok: ${widget.stock}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: widget.isLowStock
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildBottomSheet() {
  return FractionallySizedBox(
    heightFactor: 1, 
    child: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Bagian Gambar, Warna, dan Detail
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imageUrl,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp 46.000 - 50.000',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Warna: ${widget.warna}'),
                    Text('Stok: ${widget.stock}'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Bagian Warna
          Text(
            'Warna',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildColorChip('Army', true, '234'),
              _buildColorChip('Benhur', false, '124'),
              _buildColorChip('Charcoal', false, '123'),
              _buildColorChip('Carolina Blue', false, '304'),
              _buildColorChip('Cokelat', false, '35'),
              _buildColorChip('Cream', false, '244'),
              _buildColorChip('Dusty Pink', false, '94'),
              _buildColorChip('Fuji', false, '100'),
              _buildColorChip('Golder Brown', false, '54'),
            ],
          ),
          const SizedBox(height: 24),

          // Bagian Size yang bisa di-scroll
          Text(
            'Size',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Hanya area ini yang bisa discroll
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSizeChip('S'),
                  _buildSizeChip('M'),
                  _buildSizeChip('L'),
                  _buildSizeChip('XL'),
                  _buildSizeChip('2XL'),
                  _buildSizeChip('3XL'),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Kembali',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _buildColorChip(String label, bool isSelected, String count) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: isSelected ? Colors.deepOrange : Colors.grey[200],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      '$label ${isSelected ? "($count)" : ""}',
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontSize: 12,
      ),
    ),
  );
}

Widget _buildSizeChip(String size) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      '$size (45)',
      style: TextStyle(fontSize: 14),
    ),
  );
}
}
