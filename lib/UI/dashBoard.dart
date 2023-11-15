import 'package:admin_lms/Utils/utilities.dart';
import 'package:admin_lms/auth/logInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DashBoard'),
        backgroundColor: Colors.teal,
        centerTitle:true,
      actions: [
        IconButton(onPressed: (){
          _auth.signOut().then((value){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInScreen()));
          }).onError((error, stackTrace){
            Utilities().toast_meassage(error.toString());
          });
        }, icon: Icon(Icons.logout_outlined)),
        SizedBox(width: 10,)
      ],),
      body: const Column(mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Center(child: Text('DashBoardScreen'))
      ],),
    );
  }
}
