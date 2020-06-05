import 'package:flutter/material.dart';

class DashBoardContent extends StatelessWidget {
  DashBoardContent({this.image,@required this.label});

  final String label;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          image,
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label, style: TextStyle(fontSize: 20.0)),
          ),
        ]);
  }
}
