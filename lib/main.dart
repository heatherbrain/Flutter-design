import 'package:flutter/material.dart';
import 'package:from_design/screens/order_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: ListOrderScreen(), // Menggunakan NavigationMenu langsung sebagai entry point
    );
  }
}
