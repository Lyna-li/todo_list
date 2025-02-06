import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/addtask.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/theme/themeprovider.dart';
import './model/save.dart';

void main() { 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SaveTask()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: const Home(),
          routes: {
            "add": (context) =>  Addtask(), 
            "home": (context) =>  Home(),
          },
        );
      },
    );
  }
}
