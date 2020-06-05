import 'package:airqualityprediction/components/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class NonAcTemp extends StatefulWidget {
  static const String id = 'non-ac_temp';

  @override
  _NonAcTempState createState() => _NonAcTempState();
}

class _NonAcTempState extends State<NonAcTemp> {

  double temp;
  bool isLoading = false;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    databaseReference
        .child('Non-Ac')
        .once()
        .then((DataSnapshot snapshot) {
        temp = snapshot.value['Temperature']['Data'];
        print(temp);
        setState(() {

        });
        isLoading = true;



    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title:Text('Air Quality Prediction')
        ),
        body: ProgressBar(isLoading: isLoading, value: temp,room:'NON-AC ROOM',parameter: 'Temperature')
    );
  }
}
