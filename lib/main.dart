import 'package:flutter/material.dart';
import 'package:from_design/components/navigation_menu.dart';
import 'package:from_design/screens/add_order_screen.dart';
import 'package:from_design/screens/home_screen.dart';
import 'package:from_design/screens/order_screen.dart';
import 'package:from_design/screens/signin_screen.dart';
import 'package:from_design/screens/stock_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    home: StockScreen(),
  ));
}
