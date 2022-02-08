import 'package:flutter/material.dart';
import 'package:form_app/screens/constants/constant.dart';
import 'package:form_app/screens/register_screen.dart';
import 'package:form_app/screens/utils/general_alert_dialog.dart';
import 'package:form_app/widgets/general_text_field.dart';
import 'package:form_app/screens/contact_screen.dart';
import 'package:hive/hive.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () => GeneralAlertDialog().customAlertDialog(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          centerTitle: true,
          elevation: 0.0,
        ),
    
        body: Padding(
          padding: basePadding,
    
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
                          GeneralAlertDialog().customLoadingDialog(context);
                          
                          final box = await Hive.openBox(UserConstants.credentialBox);
                          await Future.delayed(
                            const Duration(seconds: 2),
                          );

                         

                          final List usernameList = box.get(
                            UserConstants.usernameKey,
                            defaultValue: [],
                          );
                          final List passwordList = box.get(
                            UserConstants.passwordKey,
                            defaultValue: [],
                          );

                          // print(usernameList.toString());
                          final boxIndex = usernameList.indexOf(usernameController.text);
                          // print(boxIndex);
                          Navigator.pop(context);
                          if(boxIndex >= 0){
                          if(password == passwordList[boxIndex]){
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ContactScreen(),
                            ),
                            );  
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Password did not match',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'User does not exist',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );

                          }
                          
                        }, 
                        child: const Text('Login'),
                        ),
                      ),
    
                      const SizedBox(height: 10),
    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account?",
                          ),
    
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen(),
                            ),
                            );
                          }, 
                          child: const Text('Register'),
                          ),
                        ],
                      ),
    
                    
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}