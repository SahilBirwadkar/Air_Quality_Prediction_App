import 'package:carousel_slider/carousel_slider.dart';
import 'package:airqualityprediction/screens/ac_screen.dart';
import 'package:flutter/material.dart';
import 'package:airqualityprediction/screens/non-ac_screen.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1528255671579-01b9e182ed1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1573170384001-5178b202b405?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
];

void main() => runApp(CarouselWithIndicator());

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  final List child = map<Widget>(
    imgList, (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, height: 600, width: 500),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Stack(
                children: <Widget>[
                  index%2==0?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('AC ROOM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),),
                  ):Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('NON-AC ROOM',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  },
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        child: CarouselSlider(
          height: 230.0,
          items: child,
          autoPlay: false,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          aspectRatio: 2.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        onTap: (){
          _current%2==0?
          Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              builder: (context) =>AcScreen(),
            ),
          ):Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              builder: (context) =>NonAcScreen(),
            ),
          );
        },
      ),

    ]);
  }
}
