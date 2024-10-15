import 'package:flutter/material.dart';
import 'package:from_design/components/navigation_menu.dart';
import 'package:from_design/model/order_model.dart';
import 'package:from_design/screens/home_screen.dart';
import 'package:get/get.dart';

class ListOrderScreen extends StatefulWidget {
  @override
  _ListOrderScreenState createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('List Order'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Color(0xFFF74904)),
            insets: EdgeInsets.symmetric(horizontal: 56.0),
          ),
          tabs: const [
            Tab(text: 'Semua'),
            Tab(text: 'Tahan'),
            Tab(text: 'Lunas'),
            Tab(text: 'Batal'),
            Tab(text: 'Draft'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OrderList(), // Semua order
          OrderList(statusFilter: OrderStatus.Tahan), 
          OrderList(statusFilter: OrderStatus.Lunas), 
          OrderList(statusFilter: OrderStatus.Batal), 
          OrderList(statusFilter: OrderStatus.Draft), 
        ],
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final OrderStatus? statusFilter;

  OrderList({this.statusFilter});

  final List<Order> orders = [
    Order(
      assetPath: 'assets/images/budiorder.png',
      name: 'Budi Syahputra',
      orderId: '#00101',
      date: '21/7/2024',
      total: 'Rp 1.359.000',
      productsCount: '12 Produk',
      statusLabel1: 'Gold Member',
      statusLabel2: OrderStatus.Tahan,
    ),
    Order(
      assetPath: 'assets/images/tokpedorder.png',
      name: 'Tokopedia',
      orderId: '#00101',
      date: '21/7/2024',
      total: 'Rp 200.480',
      productsCount: '9 Produk',
      statusLabel1: 'Tokopedia',
      statusLabel2: OrderStatus.Tahan,
    ),
    Order(
      assetPath: 'assets/images/shoporder.png',
      name: 'Shopee',
      orderId: '#00100',
      date: '2d ago',
      total: 'Rp 82.340',
      productsCount: '5 Produk',
      statusLabel1: 'Shopee',
      statusLabel2: OrderStatus.Lunas,
    ),
    Order(
      assetPath: 'assets/images/konveksiorder.png',
      name: 'Konveksi Utama',
      orderId: '#00097',
      date: '5d ago',
      total: 'Rp 200.480',
      productsCount: '3 Produk',
      statusLabel1: 'Spesial Member',
      statusLabel2: OrderStatus.Draft,
    ),
    Order(
      assetPath: 'assets/images/faqihorder.png',
      name: 'Faqih',
      orderId: '#00101',
      date: '21/7/2024',
      total: 'Rp 200.480',
      productsCount: '1 Produk',
      statusLabel1: 'Spesial Member',
      statusLabel2: OrderStatus.Batal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredOrders = statusFilter == null
        ? orders
        : orders.where((order) => order.statusLabel2 == statusFilter).toList();

    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        return OrderContainer(order: filteredOrders[index]);
      },
    );
  }
}

class OrderContainer extends StatelessWidget {
  final Order order;

  OrderContainer({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(order.assetPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${order.orderId} • ${order.date}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        order.total,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Theme(
                        data: Theme.of(context).copyWith(
                          popupMenuTheme: PopupMenuThemeData(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: PopupMenuButton<int>(
                          icon:
                              const Icon(Icons.more_vert, color: Colors.black),
                          onSelected: (value) {
                            if (value == 0) {
                            } else if (value == 1) {
                            } else if (value == 2) {
                            } else if (value == 3) {
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 0,
                              child: Row(
                                children: [
                                  Icon(Icons.edit_outlined,
                                      color: Colors.black),
                                  SizedBox(width: 8),
                                  Text("Edit"),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(Icons.share_outlined,
                                      color: Colors.black),
                                  SizedBox(width: 8),
                                  Text("Share"),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 2,
                              child: Row(
                                children: [
                                  Icon(Icons.insert_drive_file_outlined,
                                      color: Colors.black),
                                  SizedBox(width: 8),
                                  Text("Laporan"),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 3,
                              child: Row(
                                children: [
                                  Icon(Icons.delete_outline,
                                      color: Colors.black),
                                  SizedBox(width: 8),
                                  Text("Hapus"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order.productsCount.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildStatusChip(order.statusLabel1),
              const SizedBox(width: 8),
              _buildStatusChip(
                order.statusLabel2.toString().split('.').last,
                isSecondary: true,
                showDot: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label,
      {bool isSecondary = false, bool showDot = false}) {
    Color bgColor;
    switch (label) {
      case 'Lunas':
        bgColor = const Color(0xFF0D9488);
        break;
      case 'Tahan':
        bgColor = const Color(0xFF1E40AF);
        break;
      case 'Tokopedia':
        bgColor = const Color(0xFF00AA5B);
        break;
      case 'Gold Member':
        bgColor = const Color(0xFFE69D48);
        break;
      case 'Spesial Member':
        bgColor = const Color(0xFF3F4D5E);
        break;
      case 'Shopee':
        bgColor = const Color(0xFFFE7650);
        break;
      case 'Batal':
        bgColor = const Color(0xFF991B1B);
        break;
      case 'Draft':
        bgColor = const Color(0xFF979AA0);
        break;
      default:
        bgColor = isSecondary ? const Color(0xFF1E40AF) : Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          if (showDot)
            const Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Icon(
                Icons.circle,
                size: 8,
                color: Colors.white,
              ),
            ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
