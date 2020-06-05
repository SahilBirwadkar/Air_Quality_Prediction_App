import 'package:airqualityprediction/components/MainDashBoard.dart';
import 'package:airqualityprediction/parameters/ac_humidity.dart';
import 'package:airqualityprediction/parameters/ac_temp_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcScreen extends StatefulWidget {
  static const String id = 'ac_screen';

  @override
  _AcScreenState createState() => _AcScreenState();
}

class _AcScreenState extends State<AcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Air Quality Prediction')),
      backgroundColor: Color(0xFFF3F5FA),
      body: MainDashBoard(
        humidityScreen: () {
          Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              builder: (context) => AcHumidity(),
            ),
          );
        },
        tempScreen: () {
          Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              builder: (context) => AcTemp(),
            ),
          );
        },
      ),
    );
  }
}
