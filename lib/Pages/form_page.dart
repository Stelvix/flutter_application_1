import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/my_drawer.dart';
import 'package:path_provider/path_provider.dart';

class MonForm extends StatefulWidget {
  const MonForm({super.key});

  @override
  State<MonForm> createState() => _MonFormState();
}

class _MonFormState extends State<MonForm> {
  final _formKey = GlobalKey<FormState>();

  String titre = '';
  String description = '';
  bool etatIncident = false;
  final List<String> priorites = [
    "Haute priorité",
    "Priorité Moyenne",
    "Priorité Basse",
    "Aucune Priorité",
  ];
  String prioriteSelectionne = "Aucune Priorité";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _loadFile async {
    final path = await _localPath;
    return File('$path/incidents.txt');
  }

  Future<void> _writeIncident(
    String titre,
    String description,
    bool etatIncident,
    String prioriteSelectionne,
  ) async {
    final file = await _loadFile;
    // je fait le mapping de mes données en format json
    Map<String, dynamic> incidents = {
      "titre": titre,
      "description": description,
      "etatIncident": etatIncident,
      "priorite": prioriteSelectionne,
    };
    // j'encode mes données en format json et je les ajoute dans mon fichier
    String incidentData = jsonEncode(incidents) + "\n";

    await file.writeAsString(incidentData, mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulaire')),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Titre de l'incident",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Champ obligatoire" : null,
                onSaved: (value) => titre = value!,
              ),

              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(labelText: "Description"),
                validator: (value) =>
                    value!.isEmpty ? "Champ obligatoire" : null,
                onSaved: (value) => description = value!,
              ),

              const SizedBox(height: 20),

              Switch(
                value: etatIncident,
                onChanged: (value) {
                  setState(() {
                    etatIncident = value;
                  });
                },
              ),

              DropdownButtonFormField<String>(
                initialValue: prioriteSelectionne,
                items: priorites
                    .map(
                      (niveau) =>
                          DropdownMenuItem(value: niveau, child: Text(niveau)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    prioriteSelectionne = value!;
                  });
                },
                decoration: const InputDecoration(labelText: "Priorité"),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _writeIncident(
                      titre,
                      description,
                      etatIncident,
                      prioriteSelectionne,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Incident soumis avec succès!"),
                      ),
                    );
                  }
                },

                child: const Text("Soumettre"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
