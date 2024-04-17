
/////////////////////////////// Bar graph du dashboard (week overview)  ///////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/dashboard_Page/custom_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatelessWidget {
  BarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData('Mo', 128, 129, 101),
      ChartData('Tu', 123, 92, 93),
      ChartData('We', 107, 106, 90),
      ChartData('Th', 87, 95, 71),
      ChartData('Fr', 90, 80, 50),
      ChartData('Sa', 100, 75, 60),
    ];

    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Week Overview',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                width: 130,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.only(right: 8),
                        color: Color.fromARGB(255, 253, 154, 187),
                      ),
                      Text(
                        'Activity',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.only(right: 8),
                        color: const Color.fromARGB(255, 162, 207, 245),
                      ),
                      Text(
                        'Tickets',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.only(right: 8),
                        color: const Color.fromARGB(255, 240, 202, 246),
                      ),
                      Text(
                        'Deals',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 300,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(color: Colors.white), 
              ),
              primaryYAxis: NumericAxis(
                labelStyle: TextStyle(color: Colors.white),
              ),
              
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: Color.fromARGB(255, 253, 154, 187),
                ),
                ColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y1,
                  color: const Color.fromARGB(255, 162, 207, 245),
                ),
                ColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y2,
                  color: const Color.fromARGB(255, 240, 202, 246),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2);
  final String x;
  final double? y;
  final double? y1;
  final double? y2;
}
