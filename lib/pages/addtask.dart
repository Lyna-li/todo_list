import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/save.dart';
import 'package:todo_list/model/task.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key}); // Keep it const since no variables are passed

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final TextEditingController _controller = TextEditingController(); 

  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Add a task",style: TextStyle(fontFamily: 'League')),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new_outlined),
        elevation: 20,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         
        Container(
          
          height: 150,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 2.0,
                  spreadRadius: 0.5),
            ],
          ),
         
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: TextField(
            textAlign: TextAlign.center,
            controller: _controller, 
            maxLines: 1,
            
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              
              enabledBorder: OutlineInputBorder(
              
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Theme.of(context).colorScheme.primary,
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 25),
        FloatingActionButton(
  onPressed: () {
    if (_controller.text.isNotEmpty) {
      context.read<SaveTask>().addTask(
        Task(title: _controller.text),
      );
      _controller.clear(); 
      Navigator.of(context).pop();
    }
  },
  child: Icon(Icons.add,color: Theme.of(context).colorScheme.secondary)
),

       
      ]),
    );
  }
}
