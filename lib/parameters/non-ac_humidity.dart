import 'package:airqualityprediction/components/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class NonAcHumidity extends StatefulWidget {
  static const String id = 'non-ac_humidity';

  @override
  _NonAcHumidityState createState() => _NonAcHumidityState();
}

class _NonAcHumidityState extends State<NonAcHumidity> {

  double humidity;
  bool isLoading = false;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();

    databaseReference
        .child('Non-Ac')
        .once()
        .then((DataSnapshot snapshot) {
      humidity = snapshot.value['Humidity']['Data'];
      print(humidity);
      setState(() {});
      isLoading = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('Air Quality Prediction')
      ),
      body: ProgressBar(isLoading: isLoading, value: humidity,room:'NON-AC ROOM',parameter: 'Humidity'),
    );
  }
}
