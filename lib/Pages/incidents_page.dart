import 'package:flutter/material.dart';
import '../Models/incidents_models.dart';
import '../Services/incidents_services.dart';

class IncidentsPage extends StatefulWidget {
  const IncidentsPage({super.key});

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  final IncidentsServices _services = IncidentsServices();
  final TextEditingController _controller = TextEditingController();

  List<Incidents> _incidents = [];

  @override
  void initState() {
    super.initState();
    _loadIncidents();
  }

  // Recharge toute la liste depuis SQLite et met à jour l'UI

  Future<void> _loadIncidents() async {
    final incidents = await _services.fetchIncidents();
    setState(() => _incidents = incidents);
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
