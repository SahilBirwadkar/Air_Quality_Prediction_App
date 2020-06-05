import 'package:airqualityprediction/components/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:firebase_database/firebase_database.dart';


class AcTemp extends StatefulWidget {

  static const String id = 'ac_room';

  @override
  _AcTempState createState() => _AcTempState();
}

class _AcTempState extends State<AcTemp>{

  double temp;
  bool isLoading = false;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    databaseReference
        .child('AC')
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
    return Scaffold(
      appBar: AppBar(
          title:Text('Air Quality Prediction')
      ),
      body: ProgressBar(isLoading: isLoading, value: temp,room:'AC-ROOM',parameter: 'Temperature')
    );
  }
}


