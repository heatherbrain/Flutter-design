import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Marketplace extends StatelessWidget {
  const Marketplace({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Mendukung penggeseran horizontal
      child: Row(
        children: [
          _buildMarketplaceCard(
            'Tokopedia',
            'assets/images/AvatarTokped.png', // Menggunakan asset image
            '1,2RB',
            'terjual',
            const Color(0xFFF0FDF4),
          ),
          _buildMarketplaceCard(
            'Shopee',
            'assets/images/AvatarShopee.png', // Menggunakan asset image
            '2,8RB',
            'terjual',
            const Color(0xFFFFF4F0),
          ),
          _buildMarketplaceCard(
            'TikTok',
            'assets/images/Avatar.png', // Menggunakan asset image
            '500',
            'terjual',
            const Color(0xFFEFEFF1),
          ),
        ],
      ),
    );
  }

  Widget _buildMarketplaceCard(
      String name, String assetPath, String sales, String mini, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: color,
        child: Container(
          width: 224,
          height: 154,
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(assetPath),
                    backgroundColor: Colors.transparent,
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    name,
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),
              const Spacer(),
              const Text(
                'Penjualan',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Atur rata kiri
                children: [
                  Text(
                    sales,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 4), // Tambahkan spasi
                  Text(
                    mini,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
