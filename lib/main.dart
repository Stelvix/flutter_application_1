import 'package:flutter/material.dart';
import 'form_page.dart';
import 'NavigationBar.dart';

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
        body: MonForm(),

        //backgroundColor: Colors.black,
      ),
    );
  }
}
