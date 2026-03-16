import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/form_page.dart';
import '../Components/my_drawer_tile.dart';

/* 
MENU DRAWER

Un menu latérale accessible par un bouton 

-------------------------------------------------

Le menu contient un lien(tile) pour:
- l'accueil 
- pour la formpage

 */

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              MyDrawerTile(
                title: 'Accueil',
                icon: Icons.house,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              MyDrawerTile(
                title: 'Formulaire',
                icon: Icons.verified_user_sharp,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MonForm()),
                  );
                },
              ),
              MyDrawerTile(
                title: 'Deconnexion',
                icon: Icons.outbond,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
