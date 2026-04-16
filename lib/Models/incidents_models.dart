// modèle de donnée pour un incident
class Incidents {
  final int? id;
  final String titre;
  final String description;
  final bool etatIncident;
  final String priorite;

  Incidents({
    this.id,
    required this.titre,
    required this.description,
    required this.etatIncident,
    required this.priorite,
  });

  // je convertis les données pour l'inserer dans la base de données SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'etatIncident': etatIncident ? 1 : 0,
      'priorite': priorite,
    };
  }

  // je convertis les données de la base de données SQLite pour les utiliser dans mon application
  factory Incidents.fromMap(Map<String, dynamic> map) {
    return Incidents(
      id: map['id'],
      description: map['description'],
      etatIncident: map['etatIncident'],
      priorite: map['priorite'],
      titre: map['titre'],
    );
  }
}
