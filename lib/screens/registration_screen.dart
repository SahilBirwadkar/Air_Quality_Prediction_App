import 'package:airqualityprediction/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(SignUpForm());


class SignUpForm extends StatelessWidget{
  static const String id = 'registration_screen';

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sign Up UI',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SignUp(),);
  }
}



class SignUp extends StatefulWidget{
  SignUpState createState()=>SignUpState();
}



class SignUpState extends State{
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();

  Widget build(BuildContext context){


    final emailField = TextField(
      obscureText: false,
      controller: emailcontroller,
      onChanged: (value) {
        email = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final name = TextField(
      obscureText: false,
      controller: namecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final mobile = TextField(
      obscureText: false,
      controller: mobilecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final passwordField = TextField(
      obscureText: true,
      controller: passcontroller,
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.lightBlue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),

        onPressed: () {
          User user=User();
          user.email=emailcontroller.text;
          user.name=namecontroller.text;
          user.mobile=mobilecontroller.text;
          user.pass=passcontroller.text;

          showAlertDialog(context,user);
          
          

        },

        child: FlatButton(
          child: Text("Submit",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),),
          onPressed: ()async{
            try {
              final newUser = await _auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              if (newUser != null) {
                Navigator.pushNamed(context, HomeScreen.id);
              }
            } catch (e) {
              print(e);
            }
          },
        ),

      ),
    );


    return Scaffold(

      appBar: AppBar(title: Text("Signup Form")),

      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("REGISTRATION FORM",style: TextStyle(color:Colors.lightBlue,fontSize: 25)),

                    SizedBox(height: 45.0),
                    emailField,

                    SizedBox(height: 25.0),
                    name,

                    SizedBox(height: 25.0),
                    mobile,

                    SizedBox(height: 25.0),
                    passwordField,

                    SizedBox(height: 35.0,),
                    loginButon,
                    SizedBox(height: 15.0,),

                  ],),),),
          ],

        ),),);

  }
}



showAlertDialog(BuildContext context,User user){

  Widget gotIt = FlatButton(

    child: Text("Got It"),
    onPressed: () {

      Navigator.of(context, rootNavigator: true).pop('alert');
    },
  );

  AlertDialog alert = AlertDialog(

    title: Text("My title"),

    content: Text(user.email+"\n"+user.name+"\n"+user.mobile+"\n"+user.pass),

    actions: [
      gotIt,
    ],
  );


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



//model class
class User{
  String email;
  String name;
  String mobile;
  String pass;
}