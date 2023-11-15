import 'package:admin_lms/UI/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDgrnbRj_quiAhlIpRVZjNyfmNTNJ-zqG8",
            authDomain: "generallms.firebaseapp.com",
            projectId: "generallms",
            storageBucket: "generallms.appspot.com",
            messagingSenderId: "144304505985",
            appId: "1:144304505985:web:bd06183604107578d7f980",
            measurementId: "G-F30HLYFJR8"
        ));
  }
  else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:  Colors.teal,

        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
