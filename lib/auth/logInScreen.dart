import 'package:admin_lms/UI/dashBoard.dart';
import 'package:admin_lms/Utils/utilities.dart';
import 'package:admin_lms/widgets/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}
class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final email_Controller=TextEditingController();
  final password_Controller=TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email_Controller.dispose();
    password_Controller.dispose();
  }
  void login(){
    setState(() {
      loading =true;
    });
    _auth.signInWithEmailAndPassword(email: email_Controller.text,
    password: password_Controller.text.toString()).then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
      setState(() {
        loading =false;
      });
    }).
    onError((error, stackTrace){
      Utilities().toast_meassage(error.toString());
      setState(() {
        loading =false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope (onWillPop: ()async{
      SystemNavigator.pop();
      return true;
    },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children:[ Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image:AssetImage('assets/glms.png')),
                Form(
                    key: _formKey,
                    child: Column(children: [
                TextFormField(
                  controller: email_Controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Email Address',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Email';
                    }
                      return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: password_Controller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),],)),
                SizedBox(height: 50,),
                Button_Widget(title: 'Login',loading: loading, ontap: (){

                  if(_formKey.currentState!.validate()){
                    login();
                  }
                })
              ],
            ),
            ] ),
        ),
      ),
    );
  }
}
