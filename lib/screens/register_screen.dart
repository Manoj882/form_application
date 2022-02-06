import 'package:flutter/material.dart';
import 'package:form_app/screens/constants/constant.dart';
import 'package:form_app/screens/utils/general-bottom_sheet.dart';
import 'package:form_app/screens/utils/general_alert_dialog.dart';
import 'package:form_app/widgets/general_check_box.dart';
import 'package:form_app/widgets/general_drop_down.dart';
import 'package:form_app/widgets/general_radio_button.dart';
import 'package:form_app/widgets/general_switch.dart';
import 'package:form_app/widgets/general_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({ Key? key }) : super(key: key);

 
  final formKey = GlobalKey <FormState>();

  final nameController = TextEditingController();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final genderController = TextEditingController();
  final checkboxController = TextEditingController();
  final radioGenderController = TextEditingController();

  changeValue(value){
    genderController.text = value;

  }
  changeCheckBoxValue(bool value){
    checkboxController.text = value ? 'Accepted':'Not Accepted';
  }

  changeRadioValue(value){
    radioGenderController.text = value;

  }

  
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => GeneralAlertDialog().customAlertDialog(context),
    
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          elevation: 0.0,
        ),
    
        body: Padding(
          padding: basePadding,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                      ),
                      ),
                  ),
                    getSizedBox(10),
                    Center(
                      child: Text(
                        'Create an account for using the app',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    
                    getSizedBox(10),
                    const Text('Name:'),
                    getSizedBox(5),
                    GeneralTextField(
                      title: 'name', 
                      controller: nameController, 
                      textInputType: TextInputType.name, 
                      textInputAction: TextInputAction.next, 
                      validate: (value) =>
                      value!.trim().isEmpty?
                      'Please enter a name'
                      :null,
                      ),
                    
                      getSizedBox(10),
                      const Text('Username'),
                      getSizedBox(5),
                      GeneralTextField(title: 'username', 
                      controller: usernameController, 
                      textInputType: TextInputType.name, 
                      textInputAction: TextInputAction.next, 
                      validate: (value) =>
                      value!.trim().isEmpty?
                      'Please enter a username'
                      : null, 
                      ),
                    
                      getSizedBox(10),
                      const Text('Email'),
                      getSizedBox(5),
                      GeneralTextField(title: 'email', 
                      controller: emailController, textInputType: 
                      TextInputType.emailAddress, 
                      textInputAction: TextInputAction.done, 
                      validate: (value) =>
                      value!.trim().isEmpty?
                      'Please enter a email'
                      : null, 
                      ),
            
                      getSizedBox(10),
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Gender'),
                          GeneralDropDown(changeValue),
                        ],
                      ),
                      getSizedBox(10),
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Staff'),
                          GeneralSwitch(),
                        ],
                      ),
            
                      getSizedBox(10),
            
                      const Text('Salary'),
                      const CustomSlider(),
            
                      getSizedBox(10),
            
                      //Check box
                      Row(
                        children: [
                           GeneralCheckBox(changeCheckBoxValue),
                           const Text('I agree to privacy and policy'),
                        ],
                      ),
            
                      getSizedBox(10),
                      //Radio Button
                      const Text('Gender'),
                      GeneralRadioButton(changeRadioValue),
                     
            
            
                    
            
              
                      getSizedBox(20),
            
                      Center(
                        child: ElevatedButton(onPressed: () async{
                          final toRegister = await GeneralBottomSheet().customBottomSheet(context);
                          
                          // if(formKey.currentState!.validate()){
                          //   print('The name is '+nameController.text);
                          //   print('The username is '+usernameController.text);
                          //   print('The email is '+emailController.text);
                          //   print('The privacy and policy is '+checkboxController.text);
                          //   print('The gender from radio button is '+radioGenderController.text);
            
                          // }
    
                            if(toRegister != null){
                            if(toRegister){
                              print('The name is '+nameController.text);
                              print('The username is '+usernameController.text);
                              print('The email is '+emailController.text);
                              print('The privacy and policy is '+checkboxController.text);
                              print('The gender from radio button is '+radioGenderController.text);
              
                            }
                          }
                        }, 
                        child: const Text( 
                          'Sign Up',
                          ),
                        ),
                      ),
                    
                    
                  
                ],
              ),
            ),
          ),
          ),
    
      
        
      ),
    );
  }

  Widget getSizedBox(double height){
    return SizedBox(
      height: height,
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({ Key? key }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double sliderValue = 15000;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 15000,
          max: 100000,
          value: sliderValue,
          onChanged: (value) => setState(() => sliderValue = value),
        ),
        Text('The selected value is ${sliderValue.toStringAsFixed(2)}'),
      ],
      
    );
  }
}