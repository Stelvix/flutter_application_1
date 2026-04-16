import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/incidents_models.dart';

// la couche d'accès à la base SQLITE
class DbHelper {
  static Future<Database> _getDB() async {
    final path = join(await getDatabasesPath(), 'incidents.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE incidents(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titre TEXT,
            description TEXT,
            etatIncident INTEGER,
            priorite TEXT
          )
        ''');
      },
    );
  }

  // Insérer un incident
  static Future<int> insert(Incidents incidents) async {
    final db = await _getDB();
    return await db.insert(
      'incidents',
      incidents.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // récuperer tous les incidents
  static Future<List<Incidents>> getAllIncidents() async {
    final db = await _getDB();
    final maps = await db.query('incidents');
    return List.generate(maps.length, (i) => Incidents.fromMap(maps[i]));
  }

  // mettre à jour un incident
  static Future<int> UpdateIncidents(Incidents incidents) async {
    final db = await _getDB();
    return await db.update(
      'incidents',
      incidents.toMap(),
      where: 'id = ?',
      whereArgs: [incidents.id],
    );
  }

  // get by id un incident
  static Future<Incidents?> GetIncidentsById(int id) async {
    final db = await _getDB();
    // on recherche l'id d'abord pour voir son existence.
    final result = await db.query(
      'incidents',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return Incidents.fromMap(result.first);
    } else {
      return null;
    }
  }

  // supprimer un incident
  static Future<void> deleteIncident(int id) async {
    final db = await _getDB();
    await db.delete('incidents', where: 'id = ?', whereArgs: [id]);
  }
}
