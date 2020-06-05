import 'package:airqualityprediction/components/MainDashBoard.dart';
import 'package:airqualityprediction/parameters/Non-Ac_temp.dart';
import 'package:airqualityprediction/parameters/non-ac_humidity.dart';
import 'package:flutter/material.dart';


class NonAcScreen extends StatefulWidget {
  static const String id = 'non-ac_screen';

  @override
  _NonAcScreenState createState() => _NonAcScreenState();
}

class _NonAcScreenState extends State<NonAcScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Air Quality Prediction')),
      backgroundColor: Color(0xFFF3F5FA),
      body: MainDashBoard(
        humidityScreen: () {
        Navigator.push<Widget>(
          context,
          MaterialPageRoute(
            builder: (context) => NonAcHumidity(),
          ),
        );
      },
        tempScreen: () {
          Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              builder: (context) => NonAcTemp(),
            ),
          );
        },),
    );
  }
}
