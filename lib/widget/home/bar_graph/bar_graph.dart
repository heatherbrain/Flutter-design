import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:from_design/widget/home/bar_graph/bar_data.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:from_design/widget/home/bar_graph/bar_data.dart';

class BarGraph extends StatelessWidget {
  final List<double> profitData;
  final List<double> omsetData;

  const BarGraph({
    Key? key,
    required this.profitData,
    required this.omsetData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = List.generate(7, (index) {
      double profit = profitData[index];
      double omset = omsetData[index];

      return BarChartGroupData(
        x: index,
        barsSpace: -9,
        barRods: [
          BarChartRodData(
            toY: omset,
            color: Colors.grey[300],
            width: 9,
            borderRadius: BorderRadius.circular(7),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 120,
                color: const Color.fromARGB(255, 244, 244, 244),
              )
            ),
          BarChartRodData(
              toY: profit,
              color: const Color(0xFFF74904),
              width: 9,
              borderRadius: BorderRadius.circular(7),
            ),
        ],
      );
    });

    return BarChart(
      BarChartData(
        maxY: 130,
        minY: 0,
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        barGroups: barGroups,
        alignment: BarChartAlignment.center,
      ),
    );
  }
}
