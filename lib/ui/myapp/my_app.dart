import 'package:flutter/material.dart';
import 'package:space_app/ui/home/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeScreen.routname,
      routes: {
        HomeScreen.routname:(context)=> HomeScreen()

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
