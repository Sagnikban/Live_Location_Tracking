import 'package:flutter/material.dart';
import 'package:location_tracking_app/SignUp.dart';
import 'package:location_tracking_app/LogIn.dart';
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: <Widget>[
            SizedBox(height: 80),
            Container(
                height: 400,
                width: 400,
                child: Image(image: NetworkImage('https://res.cloudinary.com/dddvpe70r/image/upload/v1648128506/3259200_dkbtqn.png'))),
            SizedBox(height: 100),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                child: Container(
                  height: 60,
                  width: 500,
                  color: Colors.greenAccent,
                  child: Center(
                      child: Text(
                    "Let's Get Started",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
                ))
          ]),
        ),
      ),
    );
  }
}
