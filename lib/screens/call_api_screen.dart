import 'package:flutter/material.dart';
import 'package:form_app/models/task_model.dart';
import 'package:form_app/screens/constants/constant.dart';

class CallApiScreen extends StatelessWidget {
  const CallApiScreen(this.task,{ Key? key }) : super(key: key);

  // final String text;
  final List<TaskModel> task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Api'),

      ),
      body: Padding(
        padding: basePadding,
        // child: SingleChildScrollView(
        //   child: Text(''),
        // ),
        
        // child: buildCard(task[10]),

        child: ListView.separated(
          itemCount: task.length,
          itemBuilder: (context, index){
            return buildCard(task[index]);
          },
          separatorBuilder: (context,index) => const Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
          
          ),
          
 
      ),
      
    );
  }
}

Widget buildCard(TaskModel model){
  return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              selected: model.completed,
              selectedTileColor: Colors.grey.shade200,
              leading: CircleAvatar(
                child: Text(model.userId.toString()),
              ),
              title: Text(model.title),
            ),
          );

}