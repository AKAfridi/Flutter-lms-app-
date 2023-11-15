import 'dart:async';
import 'package:admin_lms/UI/dashBoard.dart';
import 'package:admin_lms/auth/logInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices{
  void isLogin(BuildContext context){
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    if(user!= null){
      Timer(const Duration(seconds:3), ()=> Navigator.push(context,
          MaterialPageRoute(builder: (context)=> DashBoardScreen())));

    }
    else{
      Timer(const Duration(seconds:3), ()=> Navigator.push(context,
          MaterialPageRoute(builder: (context)=> LogInScreen())));

    }
  }
}