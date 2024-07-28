import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/pie_data.dart';

class PieChartWidget extends StatelessWidget {
  final List<PieData> pieData;

  PieChartWidget({required this.pieData});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      series: <PieSeries<PieData, String>>[
        PieSeries<PieData, String>(
          dataSource: pieData,
          xValueMapper: (PieData data, _) => data.category,
          yValueMapper: (PieData data, _) => data.value,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        )
      ],
    );
  }
}
