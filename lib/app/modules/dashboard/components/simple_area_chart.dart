import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SimpleAreaChart extends StatefulWidget {
  @override
  _SimpleAreaChartState createState() => _SimpleAreaChartState();
}

class _SimpleAreaChartState extends State<SimpleAreaChart> {
  List<AreaSeries<ChartSampleData, DateTime>> _getDefaultAreaSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2000, 1, 1), y: 4, y2: 2.6),
      ChartSampleData(x: DateTime(2001, 1, 1), y: 3.0, y2: 2.8),
      ChartSampleData(x: DateTime(2002, 1, 1), y: 3.8, y2: 2.6),
      ChartSampleData(x: DateTime(2003, 1, 1), y: 3.4, y2: 3),
      ChartSampleData(x: DateTime(2004, 1, 1), y: 3.2, y2: 3.6),
      ChartSampleData(x: DateTime(2005, 1, 1), y: 3.9, y2: 3),
    ];
    return <AreaSeries<ChartSampleData, DateTime>>[
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        name: 'Product Y',
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        color: Colors.red,
        name: 'Product Y2',
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y2,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(opacity: 0.7),
      title: ChartTitle(text: 'Comparação de média de vendas por ano'),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          interval: 1,
          intervalType: DateTimeIntervalType.years,
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: 'R\$ {value}M',
          title: AxisTitle(text: 'Receita em milhões'),
          interval: 1,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getDefaultAreaSeries(),
    );
  }
}

class ChartSampleData {
  final DateTime x;
  final num y;
  final num y2;

  ChartSampleData({required this.x, required this.y, required this.y2});
}
