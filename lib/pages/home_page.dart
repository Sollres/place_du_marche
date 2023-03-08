import 'package:flutter/material.dart';
import 'package:place_du_marche/models/farm.dart';
import 'package:place_du_marche/pages/newHome.dart';
import 'package:place_du_marche/pages/profil_page.dart';
//import 'package:place_du_marche/widgets/box_ferme_widget.dart';
import 'package:place_du_marche/widgets/carte_ferme_widget.dart';
import 'package:place_du_marche/widgets/etiquette_ferme_widget.dart';
import 'package:place_du_marche/widgets/filtres_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

const backgroundColor = Color.fromRGBO(125, 206, 160, 1);
const navBarColor = Color.fromARGB(255, 85, 167, 120);
// ignore: non_constant_identifier_names
bool _isVisible = true;

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
                  text: 'Carte',
                  onPressed: () {
                    changeVisibility();
                  },
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Accueil',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const NewHome();
                        },
                      ),
                    );
                  },
                ),
                GButton(
                  icon: Icons.account_circle_outlined,
                  text: 'Profil',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Profil();
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Wrap(
                  spacing: 10,
                  children: [
                    Visibility(
                      visible: _isVisible,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        color: Colors.red,
                        height: 250.0,
                        //child: Image.asset('/Users/collinssoares/Documents/Master1_22_23/Projet/flutter_projects/place_du_marche/images/map.png'),
                      ),
                    ),
                    ProductCard(
                      farm: farms[0],
                      title: farms[0].title,
                      imagePath: farms[0].image,
                    ),
                    ProductCard(
                      farm: farms[1],
                      title: farms[1].title,
                      imagePath: farms[1].image,
                    ),
                    ProductCard(
                      farm: farms[2],
                      title: farms[2].title,
                      imagePath: farms[2].image,
                    ),
                    ProductCard(
                      farm: farms[3],
                      title: farms[3].title,
                      imagePath: farms[3].image,
                    ),
                  ],
                ),
              ),
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
}
