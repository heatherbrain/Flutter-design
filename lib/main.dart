import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:from_design/components/navigation_menu.dart';
import 'package:from_design/screens/add_order_screen.dart';
import 'package:from_design/screens/cobacoba.dart';
import 'package:from_design/screens/home_screen.dart';
import 'package:from_design/screens/order_screen.dart';
import 'package:from_design/screens/signin_screen.dart';
import 'package:from_design/screens/minstock_screen.dart';
import 'package:from_design/screens/stokadj_screen.dart';
import 'package:from_design/widget/home/bar_graph/profit_chart.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // print(dotenv.env['CLIENT_ID']);
  runApp( GetMaterialApp(
    home: ProfitChart(),
  ));
}



