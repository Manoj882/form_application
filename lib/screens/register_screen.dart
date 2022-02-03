import 'package:flutter/material.dart';
import 'package:form_app/screens/constants/constant.dart';
import 'package:form_app/widgets/general_drop_down.dart';
import 'package:form_app/widgets/general_switch.dart';
import 'package:form_app/widgets/general_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({ Key? key }) : super(key: key);

  final formKey = GlobalKey <FormState>();

  final nameController = TextEditingController();
  final usernmeController = TextEditingController();
  final emailController = TextEditingController();

  final genderController = TextEditingController();

  changeValue(value){
    genderController.text = value;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Padding(
        padding: basePadding,
        child: Form(
          key: formKey,
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
                  controller: usernmeController, textInputType: 
                  TextInputType.name, 
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
                  controller: usernmeController, textInputType: 
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

                  
                  getSizedBox(20),

                  Center(
                    child: ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()){

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