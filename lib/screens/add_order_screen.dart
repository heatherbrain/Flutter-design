import 'package:flutter/material.dart';
import 'package:from_design/components/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.offAll(() => NavigationMenu());
          },
        ),
        title: Text('Tambah Order',
            style: GoogleFonts.notoSans(color: Colors.black)),
        backgroundColor: Colors.white,
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
                  _buildMemberCategorySection(),
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
          hintStyle: GoogleFonts.notoSans(
              color: Colors.grey[400], fontWeight: FontWeight.w400),
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

 Widget _buildMemberCategorySection() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Kategori Member',
            style: GoogleFonts.notoSans(
                fontSize: 14, fontWeight: FontWeight.w400)),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text('Pilih Member',
                  style: GoogleFonts.notoSans(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ],
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
          imageUrl: 'assets/images/order1.png',
        ),
        ProductItem(
          title: 'Pendek 24\'s (New)',
          stock: 445,
          imageUrl: 'assets/images/order2.png',
        ),
        ProductItem(
          title: 'Polos shirt',
          stock: 5,
          isLowStock: true,
          imageUrl: 'assets/images/order3.png',
        ),
        ProductItem(
          title: 'Oversize 24s',
          stock: 123,
          imageUrl: 'assets/images/order4.png',
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 27.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7.0,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Pembayaran',
                  style: GoogleFonts.notoSans(
                      fontSize: 14, fontWeight: FontWeight.w400)),
              Text('Rp 0',
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.red)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Order (0)',
              style: GoogleFonts.notoSans(fontSize: 16, color: Colors.grey),
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
  final String imageUrl;
  final bool isLowStock;

  const ProductItem({
    super.key,
    required this.title,
    required this.stock,
    required this.imageUrl,
    this.isLowStock = false,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isChecked = false; // Status checkbox

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
            activeColor: const Color(0xFFF74904),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 4),
              Text(
                widget.isLowStock
                    ? 'Tersisa ${widget.stock}'
                    : 'Stok: ${widget.stock}',
                style: GoogleFonts.notoSans(
                  color: widget.isLowStock
                      ? Colors.red
                      : const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title,
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                _buildDropdown('Pilih warna dan size'),
                const SizedBox(height: 4),
                _buildDropdown('Sablon'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,
              style: GoogleFonts.notoSans(fontSize: 12, color: Colors.grey)),
          const Icon(Icons.arrow_drop_down, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
