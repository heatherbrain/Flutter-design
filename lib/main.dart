import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:from_design/components/navigation_menu.dart'; // Pastikan import ini benar, sesuai dengan lokasi file navigation_menu.dart

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
      home: const NavigationMenu(), // Menggunakan NavigationMenu langsung sebagai entry point
    );
  }
}
