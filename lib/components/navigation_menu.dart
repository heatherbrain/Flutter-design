import 'package:flutter/material.dart';
import 'package:from_design/screens/add_order_screen.dart';
import 'package:from_design/screens/home_screen.dart';
import 'package:from_design/screens/order_screen.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                        icon: Icons.home,
                        label: 'Home',
                        index: 0,
                        controller: controller),
                    _buildNavItem(
                        icon: Icons.list_alt,
                        label: 'Order',
                        index: 1,
                        controller: controller),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                        icon: Icons.shopping_bag,
                        label: 'Buying',
                        index: 2,
                        controller: controller),
                    _buildNavItem(
                        icon: Icons.account_circle_outlined,
                        label: 'Profile',
                        index: 3,
                        controller: controller),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddOrderScreen());
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFFFF6422), Color(0xFFF54A00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFFF4F0),
                spreadRadius: 9,
              ),
            ],
          ),
          child: const Icon(
            Icons.add_rounded,
            size: 34,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget untuk membuat item navigasi
  Widget _buildNavItem(
      {required IconData icon,
      required String label,
      required int index,
      required NavigationController controller}) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        controller.selectedIndex.value = index;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: controller.selectedIndex.value == index
                ? const Color.fromARGB(255, 245, 74, 0)
                : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: controller.selectedIndex.value == index
                  ? const Color.fromARGB(255, 245, 74, 0)
                  : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    ListOrderScreen(),
    Container(color: Colors.red),
    Container(color: Colors.yellow),
  ];
}
