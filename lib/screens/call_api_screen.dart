import 'package:flutter/material.dart';
import 'package:form_app/screens/constants/constant.dart';

class CallApiScreen extends StatelessWidget {
  const CallApiScreen(this.text,{ Key? key }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Api'),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: basePadding,
          child: Text(text),
      
      
        ),
      ),
      
    );
  }
}