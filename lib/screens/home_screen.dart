import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<double> weeklySummary = [
    4.40,
    4.40,
    5.40,
    4.40,
    3.40,
    4.40,
    2.40,
  ];

  List<bool> isSelected = [true, false]; // Customer terpilih default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjualan Baju'),
        backgroundColor: const Color.fromARGB(255, 245, 74, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card pertama: Penjualan
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Penjualan Baju',
                          style: GoogleFonts.notoSans(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        DropdownButton<String>(
                          value: 'Mingguan',
                          style: GoogleFonts.notoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          items: <String>['Mingguan', 'Bulanan']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/T-Shirt.png',
                              height: 64,
                              width: 64,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Omset',
                                      style: GoogleFonts.notoSans(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Text(
                                      'Rp3.5JT',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Profit',
                                      style: GoogleFonts.notoSans(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Text(
                                      'Rp2.4JT',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Tambahkan grafik atau widget lain di sini
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card kedua: Menu dengan icon
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      'List Product',
                      Icons.list_outlined,
                      const Color(0xFFECEBFF),
                      const Color(0xFF574EFA),
                    ),
                    _buildActionButtonWithBadge(
                      'Min. Stock',
                      Icons.inbox_outlined,
                      const Color(0xFFFEF2F2),
                      const Color(0xFFDC2626),
                      9,
                    ),
                    _buildActionButton(
                      'Stock Adj.',
                      Icons.settings_outlined,
                      const Color(0xFFF0FDF4),
                      const Color(0xFF16A34A),
                    ),
                    _buildActionButton(
                      'Pelanggan',
                      Icons.people_outline,
                      const Color(0xFFFFFAF2),
                      const Color(0xFFEEA23E),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Card ketiga: Transaction
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction',
                      style: GoogleFonts.notoSans(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Toggle Button Design
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFEFF1),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelected[0] = true;
                                    isSelected[1] = false;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 50),
                                  decoration: BoxDecoration(
                                    color: isSelected[0]
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Customer',
                                    style: GoogleFonts.notoSans(
                                      color: isSelected[0]
                                          ? const Color(0xFFF74904)
                                          : Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelected[0] = false;
                                    isSelected[1] = true;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 50),
                                  decoration: BoxDecoration(
                                    color: isSelected[1]
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Member',
                                    style: GoogleFonts.notoSans(
                                      color: isSelected[1]
                                          ? const Color(0xFFF74904)
                                          : Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Action Button dengan Badge
  Widget _buildActionButtonWithBadge(String label, IconData icon,
      Color backgroundColor, Color iconColor, int badgeCount) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            _buildIconButton(icon, backgroundColor, iconColor),
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$badgeCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(label, style: GoogleFonts.notoSans(fontSize: 12)),
      ],
    );
  }

  // Widget untuk Action Button tanpa Badge
  Widget _buildActionButton(
      String label, IconData icon, Color backgroundColor, Color iconColor) {
    return Column(
      children: [
        _buildIconButton(icon, backgroundColor, iconColor),
        const SizedBox(height: 6),
        Text(label, style: GoogleFonts.notoSans(fontSize: 12)),
      ],
    );
  }

  // Widget dasar untuk ikon dengan latar belakang bulat
  Widget _buildIconButton(
      IconData icon, Color backgroundColor, Color iconColor) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: iconColor),
    );
  }
}
