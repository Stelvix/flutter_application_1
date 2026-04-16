import '../Helpers/db_helper.dart';
import '../Models/incidents_models.dart';

class IncidentsServices {
  // get de tout les incidents
  Future<List<Incidents>> fetchIncidents() async {
    return await DbHelper.getAllIncidents();
  }

  // créer un incident

  Future<void> addIncidents(Incidents incidents) async {
    if (incidents.titre.isEmpty &
        incidents.description.isEmpty &
        incidents.priorite.isEmpty) {
      return;
    } else {
      final incidentCreated = Incidents(
        titre: incidents.titre,
        description: incidents.description,
        etatIncident: incidents.etatIncident,
        priorite: incidents.priorite,
      );
      await DbHelper.insert(incidentCreated);
    }
  }

  // on met a jour 




}
