import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Pastikan import GoogleFonts

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notification',
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
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF2F2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/IconPlaceholder.png',
                width: 40,
                height: 40,
              ),
            ),
            title: Row(
              children: const [
                Text(
                  '9 ',
                  style: TextStyle(
                    color: Color(0xFFDC2626),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Item baju akan habis',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            subtitle: const Text(
              'Combat 24s - habis dalam 3 hari',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }
}
