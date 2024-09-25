import 'package:flutter/material.dart';

class ListOrderScreen extends StatefulWidget {
  @override
  _ListOrderScreenState createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // 5 tab sesuai dengan menu
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
              // Tambahkan aksi untuk pencarian
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Tambahkan aksi untuk filter
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange, // Garis bawah berwarna orange
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
          Center(child: Text('Semua Orders')), // Sesuaikan dengan konten yang diinginkan
          Center(child: Text('Tahan Orders')),
          Center(child: Text('Lunas Orders')),
          Center(child: Text('Batal Orders')),
          Center(child: Text('Draft Orders')),
        ],
      ),
    );
  }
}


