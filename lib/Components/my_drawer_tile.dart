import 'package:flutter/material.dart';

/* DRAWER TITLE



// Une tuile clicable pour chaque élément du menu

-------------------------------------------

Chaque tuile contient
- un titre 
- une icone
- une action / fonction
 */

class MyDrawerTile extends StatelessWidget {
  // Déclaration des attibuts
  final String title;
  final IconData icon;
  final void Function()? onTap;

  // Constructeur
  const MyDrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  // UI
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), leading: Icon(icon), onTap: onTap);
  }
}
