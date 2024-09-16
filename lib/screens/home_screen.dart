import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child:  Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 255, 100, 34), const Color.fromARGB(255, 245, 74, 0)],
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white, // Set the color of the icon
          ),
        ),
        backgroundColor: Colors.transparent, // Make the background transparent
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        controller.selectedIndex.value = 0;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: controller.selectedIndex.value == 0 ? Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: controller.selectedIndex.value == 0 ? Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        controller.selectedIndex.value = 1;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: controller.selectedIndex.value == 1 ? Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                          ),
                          Text(
                            'Order',
                            style: TextStyle(
                              color: controller.selectedIndex.value == 1 ? Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        controller.selectedIndex.value = 2;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: controller.selectedIndex.value == 2 ? Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                          ),
                          Text(
                            'Buying',
                            style: TextStyle(
                              color: controller.selectedIndex.value == 2 ? Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        controller.selectedIndex.value = 3;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Icon(
                            Icons.account_circle_outlined,
                            color: controller.selectedIndex.value == 3 ? const Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: controller.selectedIndex.value == 3 ? const Color.fromARGB(255, 245, 74, 0) : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.red),
    Container(color: Colors.yellow),
  ];
}
