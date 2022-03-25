import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import  'package:firebase_core/firebase_core.dart';

import 'package:location_tracking_app/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EasyLoading',
      builder: EasyLoading.init(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePageWidget(),
      },

    );
  }
}
