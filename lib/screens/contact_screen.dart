
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
import 'package:form_app/screens/constants/constant.dart';
  import 'package:form_app/screens/details_screen.dart';
  import 'package:form_app/widgets/general_text_field.dart';

  class ContactScreen extends StatelessWidget {
    final formkey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final addressController = TextEditingController();
    final passwordController = TextEditingController();
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        title: const Text('Contact Form'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Padding(
       padding: basePadding,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //for Name input
                const Text('Name'),
                const SizedBox(height: 10.0),
               
               GeneralTextField(
                  title: 'name', 
                 controller: nameController,
                 textInputType: TextInputType.name,
                 textInputAction: TextInputAction.next,
                 validate: (String? value){
                   if(value!.trim().isEmpty){
                     return 'Please enter your name';
                   }
                   return null;
                 },
                 ),   
                const SizedBox(height: 10.0),
                  
                //for Age input
                const Text('Age'),
                const SizedBox(height: 10.0),

                GeneralTextField(
                 title: 'age', 
                 controller: ageController,
                 textInputType: TextInputType.number,
                 textInputAction: TextInputAction.next,
                 maxLength: 3,
                 inputFormatter: [
                   FilteringTextInputFormatter.allow(RegExp('^[0-9]*')),
                 ],
                 validate: (String? value){
                   if(value!.trim().isEmpty){
                     return 'Please enter your age';
                   }
                   else if(int.parse(value) > 120){
                     return 'Please enter a valid age';

                   }
                   return null;
                 },

                 ),
                   
                const SizedBox(height: 10.0),
                //for Address input
                const Text('Address'),
                const SizedBox(height: 10.0),
               
               //for address
               GeneralTextField(
                 title: 'address', 
                 controller: addressController,
                 textInputType: TextInputType.text,
                 textInputAction: TextInputAction.next,
                  validate: (String? value){
                   if(value!.trim().isEmpty){
                     return 'Please enter your age';
                   }
                   return null;
                 },
                 ),

                 const SizedBox(height: 10.0),
                //for Address input
                const Text('Password'),
                const SizedBox(height: 10.0),
               
               //for address
               GeneralTextField(
                 title: 'password', 
                 isObscure: true,
                 controller: passwordController,
                 textInputType: TextInputType.text,
                 textInputAction: TextInputAction.done,
                  validate: (String? value){
                   if(value!.trim().isEmpty){
                     return 'Please enter your password';
                   }
                   return null;
                 },
                 ),
                  
               const SizedBox(height: 30.0),
                  
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                      if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        // print('$name, $age, $address');
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsScreen(nameController.text,int.parse(ageController.text),ageController.text),
                        ),
                        );
          
                      }
                      
                    },
                    child: const Text('Submit'),
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