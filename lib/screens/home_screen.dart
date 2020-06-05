import 'package:airqualityprediction/components/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/dashBoard.dart';
import 'package:firebase_database/firebase_database.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final databaseReference = FirebaseDatabase.instance.reference();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('Air Quality Prediction')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 10.0,bottom: 10.0),
            child: TempDetails(text: 'My Home',textSize: 25.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: TempDetails(text: '30°C in Mumbai',textSize: 12.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10,bottom: 10.0),
            child: TempDetails(text: 'Rooms',textSize: 20.0),
          ),
          CarouselWithIndicator(),
          dashBoard(text: 'INDOOR',mode: 'Excellent',),
          dashBoard(text:'OUTDOOR',mode: 'Moderate',)
        ],
      ),
    );
  }
}


class TempDetails extends StatelessWidget {
 TempDetails({@required this.textSize,@required this.text});

 final double textSize;
 final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:textSize,
        color: Color(0xFF1D315F),
      ),
    );

  }
}
