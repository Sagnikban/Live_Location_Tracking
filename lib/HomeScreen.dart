

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
late User loggedInUser;
class _HomeScreenState extends State<HomeScreen> {
  final _auth =FirebaseAuth.instance;
  final userCollection=FirebaseFirestore.instance.collection("users");
  String name="",email="";
  void getCurrentUser( )async{
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser =user ;
      }
    }
      catch(e){
        print(e);
      }
    }

    void initState()
    {
      super.initState();
      getCurrentUser();
    }

    Future<void> userdata()async{
      final uid=loggedInUser.uid;
      DocumentSnapshot ds= await userCollection.doc(uid).get();
      name =ds.get('username');
      email=ds.get('email');
    }
  @override

  Widget build(BuildContext context) {
    return Container(
      child:Row(
        children:[
          FutureBuilder(
              future:userdata(),
              builder:(context,snapshot)
         {
               if(snapshot.connectionState!= ConnectionState.done)
               return Text("loading")  ;
               return Text("${name}");
        }

          )
        ]
      )
    );
  }
}
