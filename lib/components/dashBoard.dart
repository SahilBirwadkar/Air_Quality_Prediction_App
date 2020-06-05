import 'package:flutter/material.dart';
import 'package:airqualityprediction/components/Reusable_card.dart';

// ignore: must_be_immutable, camel_case_types
class dashBoard extends StatelessWidget {

  dashBoard({this.text,this.mode});

  String text;
  String mode;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        colour: Colors.white,
        cardChild: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/home.jpg',width: 80,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:15.0,
                              color: Color(0xFF1D315F)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            mode,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:20.0,
                                color: Color(0xFF1D315F)
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
