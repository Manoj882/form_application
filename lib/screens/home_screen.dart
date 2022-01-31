
import 'package:flutter/material.dart';
import 'package:form_app/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  int age = 0;
  String address ='';

  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for Name input
              const Text('Name'),
              const SizedBox(height: 10.0),
             TextFormField(
                // maxLength: 5,
                // maxLines: 5,
                // obscureText: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                
                  hintText: 'Enter your name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    
                  ),
        
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),
                   errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),
                  
                ),
                validator: (value){
                  if(value!.trim().isEmpty){
                    return 'Please enter your name';
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (value){
                  name=value!;
                  setState(() {
                    
                  });
                },
              ),
        
              const SizedBox(height: 10.0),
        
              //for Age input
              const Text('Age'),
              const SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
        
                decoration: const InputDecoration(
                  hintText: 'Enter your age',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    
                  ),
        
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),
                  
                  
                ),
                validator: (value){
                  if(value!.trim().isEmpty){
                    return 'Please enter your age';
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (value){
                  age =int.parse(value!);
                  setState(() {
                    
                  });
        
                },
              ),
        
              const SizedBox(height: 10.0),
              //for Address input
              const Text('Address'),
              const SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter your address',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    
                  ),
        
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),

                   errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
        
                  ),

                  
                ),
                validator: (value){
                  if(value!.trim().isEmpty){
                    return 'Please enter your address';
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (value){
                  address = value!;
                  setState(() {
                    
                  });
                },
                ),
        
             const SizedBox(height: 30.0),
        
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      // print('$name, $age, $address');
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsScreen(name, age, address),),);

                    };
                    
                  },
                  child: const Text('Submit'),
                ),
              ),
        
            ],
          ),
        ),
      ),
      
    );
  }
}