import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfitChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: LineChart(
          LineChartData(
            backgroundColor: Colors.white,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false, 
              drawHorizontalLine: true,
              horizontalInterval: 0.1, 
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey.withOpacity(0.2), 
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, _) {
                    const days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
                    return Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Text(
                        days[value.toInt()],
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    );
                  },
                  interval: 1,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
                left: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1.7),
                  FlSpot(1, 1.9),
                  FlSpot(2, 1.6),
                  FlSpot(3, 1.5),
                  FlSpot(4, 1.7),
                  FlSpot(5, 1.6),
                  FlSpot(6, 2.0),
                ],
                isCurved: true,
                color: const Color(0xFFF74904),
                barWidth: 3,
                dotData: FlDotData(
                  show: true,
                  checkToShowDot: (spot, barData) {
                    return spot.x == 2;
                  },
                  getDotPainter: (spot, percent, bar, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: const Color(0xFFF74904),
                      strokeWidth: 10,
                      strokeColor: Colors.white,
                    );
                  },
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) => Colors.black87,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) {
                    if (spot.x == 2) {
                      return LineTooltipItem(
                        'Profit: Rp.${(spot.y * 1000000).toStringAsFixed(0)}+',
                        TextStyle(
                          color: Colors.white,
                        ),
                      );
                    }
                    return null;
                  }).toList();
                },
              ),
              handleBuiltInTouches: true,
            ),
            minY: 1.4,
            maxY: 2.1, 
          ),
        ),
      ),
    );
  }
}
