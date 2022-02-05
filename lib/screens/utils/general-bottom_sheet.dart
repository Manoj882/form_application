import 'package:flutter/material.dart';
import 'package:form_app/screens/constants/constant.dart';

class GeneralBottomSheet{
  customBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context, 
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15),),
          
       
      ),
      builder: (context){
        return Padding(
          padding: basePadding,
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do you want to Register?',
                style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop(true);
                      }, 
                      child: const Text('Yes'),
                      ),

                      const SizedBox(width: 10,),
                      
                      ElevatedButton
                      (onPressed: (){
                        Navigator.of(context).pop(false);
                      }, 
                      child: const Text('No'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      ),
                    
                    
                  ],
                ),
            ],
          ),
        );
      },
      );
  }
}