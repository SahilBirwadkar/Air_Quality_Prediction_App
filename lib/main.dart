import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String id = 'main_dashboard';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Air Quality Prediction',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: LoginScreen.id,
      routes: {
        HomeScreen.id: (context)=>HomeScreen(),
        LoginScreen.id: (context)=>LoginScreen(),
        SignUpForm.id: (context)=>SignUp(),

      },
    );
  }
}



