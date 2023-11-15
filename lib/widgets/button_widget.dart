import 'package:flutter/material.dart';

class Button_Widget extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  bool loading;
  Button_Widget({super.key, required this.title,required this.ontap,this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 2,color: Colors.white,):Text(title, style: TextStyle(fontSize:20),)),
      ),
    );
  }
}
