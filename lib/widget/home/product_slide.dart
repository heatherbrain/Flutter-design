import 'package:flutter/material.dart';

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
                  children: const [
                    Text('View all', style: TextStyle(color: Colors.grey)),
                    Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Use ListView instead of SizedBox for vertical scrolling
        SizedBox(
          height: 300, // Set the height to allow vertical scrolling
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0), // Vertical margin
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product image
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
                    const SizedBox(width: 16), // Space between image and text
                    // Product information (text) next to the image
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
