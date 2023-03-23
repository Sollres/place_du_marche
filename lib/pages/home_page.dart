import 'dart:io';

import 'package:flutter/material.dart';
import 'package:place_du_marche/models/farm.dart';
import 'package:place_du_marche/pages/LoginPage.dart';
//import 'package:place_du_marche/pages/newHome.dart';
import 'package:place_du_marche/pages/profil_page.dart';
//import 'package:place_du_marche/widgets/box_ferme_widget.dart';
//import 'package:place_du_marche/widgets/carte_ferme_widget.dart';
import 'package:place_du_marche/widgets/etiquette_ferme_widget.dart';
import 'package:place_du_marche/widgets/filtres_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'ChatScreen.dart';

const backgroundColor = Color.fromRGBO(125, 206, 160, 1);
const navBarColor = Color.fromARGB(255, 85, 167, 120);
// ignore: non_constant_identifier_names
bool _isVisible = true;
bool _isOnline = true;
bool _isConnected = false;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.id,
  });

  final int? id;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: navBarColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: GNav(
              backgroundColor: navBarColor,
              tabBorderRadius: 100.0,
              hoverColor: Colors.grey,
              haptic: true,
              gap: 8,
              tabBackgroundColor: const Color.fromARGB(255, 111, 180, 141),
              tabs: [
                GButton(
                  icon: Icons.map_outlined,
                  //text: 'Carte',
                  onPressed: () {
                    changeVisibility();
                  },
                ),
                GButton(
                  icon: Icons.home,
                  //text: 'Accueil',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const HomePage();
                        },
                      ),
                    );
                  },
                ),
                GButton(
                  icon: Icons.account_circle_outlined,
                  //text: 'Profil',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ProfilPage(email: 'Petit',nom: 'Guy',prenom: 'Jean');
                        },
                      ),
                    );
                  },
                ),
                GButton(
                  icon: Icons.question_answer,
                  //text: 'Tchat',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChatScreen(userid: widget.id,recid: 2); //Mettre la page de chat ici
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                labelText: 'Recherche...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Wrap(
                spacing: 10,
                children: const [
                  ButtonFiltre(
                      title: 'Viandes',
                      bgred: 236,
                      bgvert: 112,
                      bgbleu: 99,
                      fgred: 0,
                      fgvert: 0,
                      fgbleu: 0),
                  ButtonFiltre(
                      title: 'Crémerie',
                      bgred: 236,
                      bgvert: 240,
                      bgbleu: 241,
                      fgred: 0,
                      fgvert: 0,
                      fgbleu: 0),
                  ButtonFiltre(
                      title: 'Poissons',
                      bgred: 57,
                      bgvert: 202,
                      bgbleu: 219,
                      fgred: 0,
                      fgvert: 0,
                      fgbleu: 0),
                  ButtonFiltre(
                      title: 'Vins et spiritieux',
                      bgred: 52,
                      bgvert: 181,
                      bgbleu: 134,
                      fgred: 0,
                      fgvert: 0,
                      fgbleu: 0),
                  ButtonFiltre(
                      title: 'Oeufs',
                      bgred: 231,
                      bgvert: 194,
                      bgbleu: 128,
                      fgred: 0,
                      fgvert: 0,
                      fgbleu: 0),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: _isVisible,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    color: Colors.red,
                    height: 250.0,
                  ),
                ),
                Etiquette(farm: farms[0]),
                Etiquette(farm: farms[1]),
                Etiquette(farm: farms[2]),
                Etiquette(farm: farms[3]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeStatus() {
    setState(() {
      _isOnline = !_isOnline;
    });
  }
}
