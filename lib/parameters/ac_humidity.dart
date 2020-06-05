import 'package:airqualityprediction/components/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class AcHumidity extends StatefulWidget {
  static const String id = 'ac_humidity';
  @override
  _AcHumidityState createState() => _AcHumidityState();
}

class _AcHumidityState extends State<AcHumidity> {

  double humidity;
  bool isLoading = false;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();

    databaseReference
        .child('AC')
        .once()
        .then((DataSnapshot snapshot) {
      humidity = snapshot.value['Humidity']['Data'];
      print(humidity);
      setState(() {
      });
      isLoading = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('Air Quality Prediction')
      ),
      body: ProgressBar(isLoading: isLoading, value: humidity,room:'AC-ROOM',parameter: 'Humidity'),
    );
  }
}



