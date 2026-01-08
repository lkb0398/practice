import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vitameal/domain/entity/goal_datas_entity.dart';

class Graph extends StatelessWidget {
  const Graph({super.key, required this.datas});

  final List<GoalDatasEntity> datas;

  @override
  Widget build(BuildContext context) {
    if (datas.isEmpty) {
      return Center(child: Text("데이터를 입력해주세요"));
    }

    // data_value 리스트 추출
    final sortedDatas = [...datas]
      ..sort((a, b) => a.dataDate.compareTo(b.dataDate));
    final values = sortedDatas.map((e) => e.dataValue).toList();

    final maxValue = values.reduce(max);
    final minValue = values.reduce(min);
    final gap = maxValue - minValue;
    final interval = (gap / 4 + minValue).toInt();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 220,
      child: LineChart(
        LineChartData(
          minY: minValue,
          maxY: maxValue,

          /// ===== Grid =====
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            horizontalInterval: interval == 0 ? 1 : interval.toDouble(),
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.grey[200], strokeWidth: 1),
            drawVerticalLine: true,
            verticalInterval: 1,
            getDrawingVerticalLine: (value) =>
                FlLine(color: Colors.grey[200], strokeWidth: 1),
          ),

          /// ===== Titles =====
          titlesData: FlTitlesData(
            /// 좌측 (data_value)
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: interval == 0 ? 1 : interval.toDouble(),
                reservedSize: 30,
                getTitlesWidget: (value, _) {
                  return Text(
                    value % 1 == 0
                        ? value.toInt().toString()
                        : value.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),

            /// 하단 (data_date)
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, _) {
                  final index = value.toInt();
                  if (index < 0 || index >= sortedDatas.length) {
                    return const SizedBox.shrink();
                  }

                  final date = sortedDatas[index].dataDate;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${date.month}/${date.day}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),

            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          borderData: FlBorderData(show: false),

          /// ===== Line =====
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                sortedDatas.length,
                (index) =>
                    FlSpot(index.toDouble(), sortedDatas[index].dataValue),
              ),
              isCurved: false,
              color: Colors.redAccent,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [Colors.redAccent[100]!, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
