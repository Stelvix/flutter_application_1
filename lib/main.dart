import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

void main() => runApp(MaterialApp(home: MonApp()));

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signalez une panne réseau'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: const HomePage(),

        //backgroundColor: Colors.black,
      ),
    );
  }
}
