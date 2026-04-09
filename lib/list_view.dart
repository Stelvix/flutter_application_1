import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/my_drawer.dart';
import 'package:flutter_application_1/form_page.dart';

Future<List<Map<String, dynamic>>> _lireIncidents() async{
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/incidents.txt');

  if(!await file.exists()){
    return [];
  } else{
    List<String> lines = await file.readAsLines();
    // je parse chaque ligne du fichier en format json et je les ajoute dans une liste
    return lines.map((line) => jsonDecode(line)) as Map<String, dynamic>).toList();
  }
}