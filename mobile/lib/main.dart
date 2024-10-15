import 'package:flutter/material.dart';
import 'screen/form_screen.dart';
import 'screen/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco NuFurto',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(),
        '/form': (context) => FormScreen(),
      },
    );
  }
}
