import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:from_design/screens/home_screen.dart';
import 'package:from_design/components/navigation_menu.dart';

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
      home: const MainScreen(), // Main entry point of your app
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]), 
      bottomNavigationBar: const NavigationMenu(), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 255, 100, 34), Color.fromARGB(255, 245, 74, 0)],
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
    );
  }
}
