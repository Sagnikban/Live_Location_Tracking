

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      color: Colors.lightBlueAccent,
      child:Row(
        children:[
          FutureBuilder(
              future:userdata(),
              builder:(context,snapshot)
         {
               if(snapshot.connectionState!= ConnectionState.done)
               return Text("loading")  ;
               return Column(
                 children: [
                   Row(
                     children: [
                       Container(
                           padding:EdgeInsets.fromLTRB(70, 100, 30, 0),
                           child: Text(
                             "Hello!",
                             style: TextStyle(
                                 color: Colors.deepPurple,
                                 fontWeight: FontWeight.w500,
                                 fontSize: 30),
                           )),

                       Container(
                           padding:EdgeInsets.fromLTRB(0, 100, 0, 0),
                           child: Text(
                             "${name}",
                             style: TextStyle(
                                 color: Colors.deepPurpleAccent,
                                 fontWeight: FontWeight.w500,
                                 fontSize: 30),
                           )),
                     ],
                   ),

                   Container(

                       margin:EdgeInsets.fromLTRB(60, 30, 0, 0),
                         decoration: BoxDecoration(
                         //border: Border.all(color:Colors.green),
                       ),

                       child:Text('$email',
         style: TextStyle(
         color: Colors.purple,
         fontWeight: FontWeight.w500,
         fontSize: 30),
         )

                       ),


                                    ],
               );


         }

          )
        ]
      )
    );
  }
}
