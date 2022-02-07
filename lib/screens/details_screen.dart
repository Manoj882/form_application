import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_app/models/task_model.dart';
import 'package:form_app/screens/call_api_screen.dart';
import 'package:form_app/screens/constants/constant.dart';
import 'package:form_app/screens/constants/urls.dart';
import 'package:form_app/screens/utils/general_alert_dialog.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(this.name, this.age, this.address,{ Key? key }) : super(key: key);

  final String name;
  final int age;
  final String address;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        elevation: 0.0,
      ),

      body:  Padding(
       padding: basePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Name: $name',
                style:Theme.of(context).textTheme.headline6,

              ),
            ),

            const SizedBox(height: 10.0),

            Text(
              'Age: $age',
              style: Theme.of(context).textTheme.bodyText1,
            ),
           const SizedBox(height: 10.0,),

           Text(
             'Address: $address',
             style: Theme.of(context).textTheme.bodyText1,

           ),

           const SizedBox(
             height: 20,
           ),

           ElevatedButton(
            onPressed: () async{
              print('I am api');
              GeneralAlertDialog().customLoadingDialog(context);
              final response = await http.get(Uri.parse(getAllTodos));
              Navigator.of(context).pop();
              print(response.statusCode);
              final decodedResponse = jsonDecode(response.body) as List;
              List <TaskModel> tasksList = [];
              // print(decodedResponse);
              // print(decodedResponse.runtimeType);
              for(var eachResponse in decodedResponse){
                tasksList.add(TaskModel.fromJson(eachResponse));
              }
              print('The length of task model list is ${tasksList.length}');
              // print(response.body);
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => CallApiScreen(tasksList),
              ),
              );
            }, 
            child: const Text('Call Api'),
           ),
          ],

        ),
      ),
      
    );
  }
}