import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:onbank/constant.dart';

class ExpenseChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExpenseChartState();
}

class ExpenseChartState extends State<ExpenseChart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1350),
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(6), topRight: Radius.circular(6));
    final double width = 45;
    return AspectRatio(
      aspectRatio: 1.22,
      child: AnimatedBuilder(
        animation: _animationController,
        // tween: Tween<double>(begin: 0, end: 1),
        // curve: Curves.fastOutSlowIn,
        // duration: const Duration(milliseconds: 800),
        builder: (context, child) {
          return Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: mainColor,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 650,
                minY: 0,
                barTouchData: BarTouchData(
                  enabled: false,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.transparent,
                    tooltipPadding: const EdgeInsets.all(0),
                    tooltipMargin: 8,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        rod.y.round().toString(),
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 14,
                        fontFamily: "Poppins"),
                    margin: 20,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Mar';
                        case 1:
                          return 'Apr';
                        case 2:
                          return 'May';
                        case 3:
                          return 'Jun';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 100:
                          return '100';
                        case 200:
                          return '200';
                        case 300:
                          return '300';
                        case 400:
                          return '400';
                        case 500:
                          return '500';
                        case 600:
                          return '1K';
                      }
                      return '';
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 100 == 0,
                  getDrawingHorizontalLine: (value) {
                    if (value == 0) {
                      return FlLine(
                          color: Colors.grey.shade300, strokeWidth: 3);
                    }

                    return FlLine(
                      color: Colors.grey.withOpacity(0.5),
                      strokeWidth: 0.5,
                    );
                  },
                ),
                borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.grey.withOpacity(0.4)),
                    )),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                          borderRadius: borderRadius,
                          width: width,
                          y: _animationController.value * 422,
                          colors: [secondaryColor, pinkShade])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                          borderRadius: borderRadius,
                          width: width,
                          y: _animationController.value * 345,
                          colors: [secondaryColor, pinkShade])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                          borderRadius: borderRadius,
                          width: width,
                          y: _animationController.value * 390,
                          colors: [secondaryColor, pinkShade])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          borderRadius: borderRadius,
                          width: width,
                          y: _animationController.value * 456,
                          colors: [secondaryColor, pinkShade])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  // BarChartGroupData(
                  //   x: 3,
                  //   barRods: [
                  //     BarChartRodData(
                  //         y: 13,
                  //         colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  //   ],
                  //   showingTooltipIndicators: [0],
                  // ),
                  // BarChartGroupData(
                  //   x: 3,
                  //   barRods: [
                  //     BarChartRodData(
                  //         y: 10,
                  //         colors: [Colors.lightBlueAccent, Colors.greenAccent])
                  //   ],
                  //   showingTooltipIndicators: [0],
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
