import 'package:flutter/material.dart';
import 'package:form_app/screens/contact_screen.dart';
import 'package:form_app/screens/login_screen.dart';
import 'package:form_app/screens/register_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  print(dir.path);
  Hive.init(dir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreen(),
      home: RegisterScreen(),
    );
  }
}

