import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/save.dart';
import 'package:todo_list/theme/themeprovider.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final time = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "To-do List",
          style: TextStyle(fontFamily: 'League', fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(Icons.sunny),
          ),
        ],
        elevation: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("add");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: Consumer<SaveTask>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          context
                              .read<SaveTask>()
                              .removeTask(task.tasks[index]);
                        },
                        icon: Icons.delete,
                        backgroundColor: Colors.red.shade400,
                        borderRadius: BorderRadius.only(
                          topRight:
                              Radius.circular(8), // Top right corner rounded
                          bottomRight:
                              Radius.circular(8), // Bottom right corner rounded
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                      trailing: Column(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 16,
                          ),
                          SizedBox(width: 10),
                          Text(
                            DateFormat("HH:mm")
                                .format(task.tasks[index].createdAt),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        task.tasks[index].title,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontFamily: 'League',
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
