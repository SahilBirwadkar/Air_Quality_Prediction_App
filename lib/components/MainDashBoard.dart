import 'package:airqualityprediction/parameters/ac_humidity.dart';
import 'package:airqualityprediction/parameters/ac_temp_room.dart';
import 'package:flutter/material.dart';
import 'DashBoardContent.dart';
import 'Dashboard_Card.dart';

class MainDashBoard extends StatelessWidget {

  MainDashBoard({@required this.humidityScreen,@required this.tempScreen});

  final Function humidityScreen;
  final Function tempScreen;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: DashboardCard(
                  onPress:humidityScreen,
                  colour: Colors.white,
                  cardChild:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DashBoardContent(image: Image.asset('images/humidity.PNG'), label: 'Humidity'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: DashboardCard(
                  onPress: tempScreen,
                  colour: Colors.white,
                  cardChild:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DashBoardContent(image: Image.asset('images/temp.PNG'), label: 'Temperature'),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: DashboardCard(
                  colour: Colors.white,
                  cardChild:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DashBoardContent(image: Image.asset('images/power.PNG'), label: 'Power'),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}