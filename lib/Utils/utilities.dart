import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utilities{
  void toast_meassage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.green,
        fontSize: 16.0
    );
  }

}