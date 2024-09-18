import 'package:flutter/material.dart';
import 'package:from_design/screens/home_screen.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Obx(() => BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
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
                        color: controller.selectedIndex.value == 0
                            ? const Color.fromARGB(255, 245, 74, 0)
                            : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? const Color.fromARGB(255, 245, 74, 0)
                              : Colors.grey,
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
                        color: controller.selectedIndex.value == 1
                            ? const Color.fromARGB(255, 245, 74, 0)
                            : Colors.grey,
                      ),
                      Text(
                        'Order',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 1
                              ? const Color.fromARGB(255, 245, 74, 0)
                              : Colors.grey,
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
                        color: controller.selectedIndex.value == 2
                            ? const Color.fromARGB(255, 245, 74, 0)
                            : Colors.grey,
                      ),
                      Text(
                        'Buying',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 2
                              ? const Color.fromARGB(255, 245, 74, 0)
                              : Colors.grey,
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
                        color: controller.selectedIndex.value == 3
                            ? const Color.fromARGB(255, 245, 74, 0)
                            : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: controller.selectedIndex.value == 3
                              ? const Color.fromARGB(255, 245, 74, 0)
                              : Colors.grey,
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
    ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.red),
    Container(color: Colors.yellow),
  ];
}
