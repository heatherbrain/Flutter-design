import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Tambahkan import ini

class PopularProducts extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/images/produk1.png',
      'name': 'Pendek 30\'s (New)',
      'variant': 'Hitam XL',
      'stock': '42pcs',
    },
    {
      'image': 'assets/images/produk2.png',
      'name': 'Pendek 30\'s (New)',
      'variant': 'Hitam L',
      'stock': '30pcs',
    },
    {
      'image': 'assets/images/produk3.png',
      'name': 'Pendek 30\'s (New)',
      'variant': 'Maroon M',
      'stock': '21pcs',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'View all',
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Menggunakan ListView untuk scrolling vertikal
        SizedBox(
          height: 300, // Atur tinggi untuk mengizinkan scrolling vertikal
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0), // Margin vertikal
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar produk
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16), // Jarak antara gambar dan teks
                    // Informasi produk (teks) di sebelah gambar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            product['variant']!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            product['stock']!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
