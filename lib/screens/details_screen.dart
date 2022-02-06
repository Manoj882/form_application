import 'package:flutter/material.dart';
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
              // print(response.body);
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => CallApiScreen(response.body),
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