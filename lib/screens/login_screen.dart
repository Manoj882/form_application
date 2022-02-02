import 'package:flutter/material.dart';
import 'package:form_app/screens/utils/general_alert_dialog.dart';
import 'package:form_app/widgets/general_text_field.dart';
import 'package:form_app/screens/contact_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);

  final formKey = GlobalKey<FormState>;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0, 
        ),

        child: SingleChildScrollView(
          child: Form(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Sign in with your credentials',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 10.0,),
                Center(
                  child: Text(
                    'Login here',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
          
                const SizedBox(height: 30.0,),
          
                const Text('Username'),
                const SizedBox(height: 5.0,),
                GeneralTextField(
                  title: 'username', 
                  controller: usernameController, 
                  textInputType: TextInputType.name, 
                  textInputAction: TextInputAction.next, 
                  validate: (value) => value!.trim().isEmpty
                  ? 'Please enter your username'
                  :null,
                  ),
          
                  const SizedBox(height: 10.0,),
          
                  const Text('Password'),
                  const SizedBox(height: 5.0,),
                  GeneralTextField(
                    title: 'password', 
                    controller: passwordController, 
                    textInputType: TextInputType.name, 
                    textInputAction: TextInputAction.done, 
                    validate: (value) => value!.trim().isEmpty 
                    ? 'Please enter your password'
                    : null,
                    ),
          
                    const SizedBox(height: 10.0,),
          
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                        final username = usernameController.text;
                        final password = passwordController.text;
                        GeneralAlertDialog().customAlertDialog(context);
                        await Future.delayed(
                          const Duration(seconds: 3),
                        );
                      
                        Navigator.pop(context);
                        if(username == 'manoj' && password =='manoj123'){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ContactScreen(),
                          ),
                          );
                          
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Invalid details',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                        
                      }, 
                      child: const Text('Login'),
                      ),
                    ),
                  
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}