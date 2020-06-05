import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ProgressBar extends StatelessWidget {

  ProgressBar({this.isLoading,this.value,this.room,this.parameter});

  final String room;
  final bool isLoading;
  final double value;
  final String parameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              room,style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Color(0xFF1D315F)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 125.0,top: 25.0),
            child: Text(
              parameter,
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xFF1D315F)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                height: 350.0,
                width: 125.0,
                child: FAProgressBar(
                  backgroundColor: Color(0xFFF3F5FA),
                  direction: Axis.vertical,
                  verticalDirection: VerticalDirection.up,
                  currentValue:value.toInt(),
                  displayText: '%',
                  progressColor: Color(0xFF6170FF),
                ),
              ),
            ),
          ),
        ],
      ):
      Center(
        child: Text(
          'Loading...',style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6170FF)
        ),
        ),
      ),
    );
  }
}