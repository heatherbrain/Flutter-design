import 'package:flutter/material.dart';
import 'package:from_design/screens/minstock_screen.dart';
import 'package:from_design/screens/stokadj_screen.dart';
import 'package:from_design/widget/home/marketplace.dart';
import 'package:from_design/widget/home/notification.dart';
import 'package:from_design/widget/home/product_slide.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
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

  List<bool> isSelected = [true, false];
  String dropdownValue = 'Mingguan';
  String transactionDropdownValue = 'This week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 74, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // height: 230,
                child: _buildSalesCardSlider(),
              ),
              const SizedBox(height: 20),
              _buildActionButtons(),
              const SizedBox(height: 20),
              _buildTransactionSection(),
              const SizedBox(height: 20),
              _buildTransactionFilter(),
              const SizedBox(height: 20),
              Marketplace(),
              const NotificationList(),
              PopularProducts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSalesCardSlider() {
    return SizedBox(
      height: 225,
      child: PageView(
        children: [
          _buildSalesCard1(),
          _buildSalesCard2(),
        ],
      ),
    );
  }

  Widget _buildSalesCard1() {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                  items: <String>['Mingguan', 'Bulanan'].map((String value) {
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
                            Row(children: [
                              Text(
                                'Rp',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '800RB',
                                style: GoogleFonts.notoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ])
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
                            Row(children: [
                              Text(
                                'Rp',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '800RB',
                                style: GoogleFonts.notoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesCard2() {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                  items: <String>['Mingguan', 'Bulanan'].map((String value) {
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
                            Row(children: [
                              Text(
                                'Rp',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '3.5JT',
                                style: GoogleFonts.notoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ])
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
                            Row(children: [
                              Text(
                                'Rp',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '2.4JT  ',
                                style: GoogleFonts.notoSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton('List Product', Icons.list_outlined,
                const Color(0xFFECEBFF), const Color(0xFF574EFA),
                onTap: () {}),
            _buildActionButtonWithBadge(
              'Min. Stock',
              Icons.inbox_outlined,
              const Color(0xFFFEF2F2),
              const Color(0xFFDC2626),
              9,
              onTap: () {
                Get.to(() => MinstockScreen());
              },
            ),
            _buildActionButton(
              'Stock Adj.',
              Icons.settings_outlined,
              const Color(0xFFF0FDF4),
              const Color(0xFF16A34A),
              onTap: () {
                Get.to(() => StockadjScreen());
              },
            ),
            _buildActionButton('Pelanggan', Icons.people_outline,
                const Color(0xFFFFFAF2), const Color(0xFFEEA23E),
                onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionSection() {
    return Container(
      padding: const EdgeInsets.all(5.0),
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
            ],
          ),
          const SizedBox(height: 5),
          _buildCustomerMemberSwitch(),
        ],
      ),
    );
  }

  Widget _buildCustomerMemberSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFEFEFF1),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Row(
            children: [
              _buildSwitchButton('Customer', 0),
              _buildSwitchButton('Member', 1),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected[index] = true;
          isSelected[1 - index] = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
        decoration: BoxDecoration(
          color: isSelected[index] ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: isSelected[index] ? const Color(0xFFF74904) : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownButton<String>(
          value: transactionDropdownValue,
          style: GoogleFonts.notoSans(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
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
    );
  }
}

Widget _buildActionButtonWithBadge(
  String label,
  IconData icon,
  Color backgroundColor,
  Color iconColor,
  int badgeCount, {
  required void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
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
    ),
  );
}

Widget _buildActionButton(
  String label,
  IconData icon,
  Color backgroundColor,
  Color iconColor, {
  required void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        _buildIconButton(icon, backgroundColor, iconColor),
        const SizedBox(height: 6),
        Text(label, style: GoogleFonts.notoSans(fontSize: 12)),
      ],
    ),
  );
}

Widget _buildIconButton(IconData icon, Color backgroundColor, Color iconColor) {
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
