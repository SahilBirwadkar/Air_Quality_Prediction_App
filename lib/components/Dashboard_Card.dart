import 'package:flutter/material.dart';
class DashboardCard extends StatelessWidget {
  DashboardCard({@required this.colour,this.onPress, this.cardChild});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 1.0),
            )
          ],
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}