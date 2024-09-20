import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
  String dropdownValue = 'Mingguan'; // State untuk Dropdown
  String transactionDropdownValue =
      'This week'; // State untuk Transaction Dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
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
                          value: dropdownValue,
                          style: GoogleFonts.notoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          items: <String>['Mingguan', 'Bulanan']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
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
                      Color(0xFFECEBFF),
                      Color(0xFF574EFA),
                    ),
                    _buildActionButtonWithBadge(
                      'Min. Stock',
                      Icons.inbox_outlined,
                      Color(0xFFFEF2F2),
                      Color(0xFFDC2626),
                      9,
                    ),
                    _buildActionButton(
                      'Stock Adj.',
                      Icons.settings_outlined,
                      Color(0xFFF0FDF4),
                      Color(0xFF16A34A),
                    ),
                    _buildActionButton(
                      'Pelanggan',
                      Icons.people_outline,
                      Color(0xFFFFFAF2),
                      Color(0xFFEEA23E),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction',
                          style: GoogleFonts.notoSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          // Bungkus teks dan ikon dalam Row baru
                          children: [
                            Text(
                              'View all',
                              style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                                width: 4), // Jarak antara teks dan ikon
                            const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Toggle Button Design
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFEFF1),
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
                                          ? Color(0xFFF74904)
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
                                          ? Color(0xFFF74904)
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

            // Dropdown di akhir halaman
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  value: transactionDropdownValue,
                  style: GoogleFonts.notoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  items: <String>['This week', 'This month', 'This year']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      transactionDropdownValue = newValue!;
                    });
                  },
                ),
              ],
            )
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
