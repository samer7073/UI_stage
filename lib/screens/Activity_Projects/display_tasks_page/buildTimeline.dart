
////////////////////////////////////////// Timeline Design ////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';

class buildTimeline extends StatelessWidget {
  const buildTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
            indicatorXY: 0,
            width: 15,
            indicator: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Colors.blue),
              ),
            )),
        afterLineStyle: LineStyle(thickness: 2, color: Colors.blue),
      ),
    );
  }
}
