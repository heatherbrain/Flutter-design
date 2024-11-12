import 'package:flutter/material.dart';
import 'package:from_design/widget/home/bar_graph/bar_graph.dart';

class Cobacoba extends StatefulWidget {
  const Cobacoba({super.key});

  @override
  State<Cobacoba> createState() => _CobacobaState();
}

class _CobacobaState extends State<Cobacoba> {
  List<List<double>> weeklySummary = [
    [34.40, 22.50, 42.42, 50.50, 100.20, 88.99, 90.10], // Profit
    [54.60, 42.70, 52.62, 90.70, 110.30, 98.109, 100.20] // Omset
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: 300,
        child: BarGraph(
          profitData: weeklySummary[0], 
          omsetData: weeklySummary[1], 
        ),
      ),
    );
  }
}

