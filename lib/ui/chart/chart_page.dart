
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'charts_sample_data.dart';

class ChartExample extends StatefulWidget{
  @override
  State<ChartExample> createState() => _ChartExampleState();
}

class _ChartExampleState extends State<ChartExample> {
  var chartIndex = 1;
  // List<ChartSampleData>? chartData;
  // TooltipBehavior? _tooltipBehavior;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   chartData = <ChartSampleData>[
  //     ChartSampleData(
  //         x: 'saturday', y: 4900, secondSeriesYValue: 800),
  //     ChartSampleData(
  //         x: 'sunday', y: 1800, secondSeriesYValue: 1000),
  //     ChartSampleData(
  //         x: 'monday', y: 1200, secondSeriesYValue: 1000),
  //     ChartSampleData(
  //         x: 'tuesday', y: 1400, secondSeriesYValue: 800),
  //     ChartSampleData(
  //         x: 'wednesday', y: 1800, secondSeriesYValue: 500),
  //     ChartSampleData(
  //         x: 'thursday', y:1200, secondSeriesYValue: 1000),
  //     ChartSampleData(
  //         x: 'friday', y: 800, secondSeriesYValue: 500),
  //   ];
  // }

  // @override
  // void dispose() {
  //   chartData!.clear();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chart Example'),),
      // body: Center(child: buildSpacingColumnChart(_tooltipBehavior!, chartData, context, 1),),
      body: Center(child: Text('asdasd'),),

    );
  }
}


// SfCartesianChart buildSpacingColumnChart(TooltipBehavior tooltipBehavior,
//     List<ChartSampleData>? chartData, BuildContext context,int index) {
//   return SfCartesianChart(
//     plotAreaBorderWidth: 0,
//     // title: ChartTitle(
//     //     text: 'Winter olympic medals count - 2022'),
//     primaryXAxis: CategoryAxis(
//       majorGridLines: const MajorGridLines(width: 0),
//     ),
//     primaryYAxis: NumericAxis(
//         maximum:(index==1) ? 10000 :(index==2)?70000:800000,
//         minimum: 0,
//         interval:(index==1)? 2000:(index==2)?10000:100000,
//         axisLine: const AxisLine(width: 0),
//         majorTickLines: const MajorTickLines(size: 0)),
//     series: getDefaultColumn(chartData, context,index),
//     // legend: Legend(isVisible: !isCardView),
//     tooltipBehavior: tooltipBehavior,
//   );
// }
//
// List<ColumnSeries<ChartSampleData, String>> getDefaultColumn(
//     List<ChartSampleData>? chartData, BuildContext context,int index) {
//
//
//
//   return <ColumnSeries<ChartSampleData, String>>[
//     ColumnSeries<ChartSampleData, String>(
//
//         width: 0.4,
//         spacing: 0.0,
//         dataSource: chartData!,
//         borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//         // color: LightThemeColors.primaryColor,
//         gradient: const LinearGradient(
//
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xff3DEBA3),
//             Color(0xff3DEBA3),
//             Color(0xff3CB371),
//           ],
//
//         ),
//         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//         yValueMapper: (ChartSampleData sales, _) =>sales.y,
//         name: 'texts.step'),
//     ColumnSeries<ChartSampleData, String>(
//         dataSource: chartData!,
//         width: 0.3,
//         borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//         spacing: 0.0,
//         // color: Color(0xffFFD468),
//         gradient: const LinearGradient(
//
//           begin: Alignment.topCenter,
//
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xffFFB655),
//             Color(0xffFFF47D),
//             Color(0xffFFF47D),
//           ],
//
//         ),
//         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//         yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
//         name: 'texts.eToman'),
//   ];
// }