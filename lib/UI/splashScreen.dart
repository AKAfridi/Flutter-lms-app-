import 'package:admin_lms/fireBaseServices/splashServices.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashservices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Welcome In',
              textAlign:TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal),
            ),),
          Image(image:AssetImage('assets/glms.png')),




        ],
      ),
    );
  }
}
