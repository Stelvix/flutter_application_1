import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Titre de l'incident",
              ),
              validator: (value) => value!.isEmpty ? "Champ obligatoire" : null,
              onSaved: (value) => titre = value!,
            ),

            const SizedBox(height: 20),

            TextFormField(
              decoration: const InputDecoration(labelText: "Description"),
              validator: (value) => value!.isEmpty ? "Champ obligatoire" : null,
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

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Rapport d'incident envoyé avec succès, RECAP : \n"
                        "Titre: $titre\n"
                        "Description: $description\n"
                        "Etat de l'incident: ${etatIncident ? "Etat critique" : "Pas critique"}\n"
                        "Priorité: $prioriteSelectionne",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Envoyer"),
            ),
          ],
        ),
      ),
    );
  }
}
