import 'package:flutter/material.dart';
import 'package:from_design/model/order_model.dart';

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
      appBar: AppBar(
        title: const Text('List Order'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Tambahkan aksi untuk tombol back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
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
          OrderList(),
          Center(child: Text('Tahan Orders')),
          Center(child: Text('Lunas Orders')),
          Center(child: Text('Batal Orders')),
          Center(child: Text('Draft Orders')),
        ],
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final List<Order> orders = [
    Order(
      assetPath:'assets/images/budiorder.png',
      name: 'Budi Syahputra',
      orderId: '#00101',
      date: '21/7/2024',
      total: 'Rp 1.359.000',
      productsCount: '12 Produk',
      statusLabel1: 'Gold Member',
      statusLabel2: 'Tahan',
    ),
    Order(
      assetPath:'assets/images/tokpedorder.png',
      name: 'Tokopedia',
      orderId: '#00101',
      date: '21/7/2024',
      total: 'Rp 200.480',
      productsCount: '9 Produk',
      statusLabel1: 'Tokopedia',
      statusLabel2: 'Tahan',
    ),
    Order(
      assetPath:'assets/images/shoporder.png',
      name: 'Shopee',
      orderId: '#00100',
      date: '2d ago',
      total: 'Rp 82.340',
      productsCount: '5 Produk',
      statusLabel1: 'Shopee',
      statusLabel2: 'Tahan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(order.assetPath),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.name,
                        style: TextStyle(
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      order.total,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Icon(Icons.more_vert, color: Colors.grey),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  order.productsCount,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                Spacer(),
                _buildStatusChip(order.statusLabel1),
                SizedBox(width: 8),
                _buildStatusChip(order.statusLabel2, isSecondary: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String label, {bool isSecondary = false}) {
    Color bgColor = isSecondary ? Colors.blue.withOpacity(0.1) : Colors.orange.withOpacity(0.1);
    Color textColor = isSecondary ? Colors.blue : Colors.orange;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
        ),
      ),
    );
  }

