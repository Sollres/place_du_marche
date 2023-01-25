import 'package:flutter/material.dart';
import 'package:place_du_marche/widgets/box_ferme_widget.dart';
import 'package:place_du_marche/widgets/filtres_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

const backgroundColor = Color.fromRGBO(125, 206, 160, 1);
const navBarColor = Color.fromARGB(255, 85, 167, 120);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: GNav(
              backgroundColor: navBarColor,
              tabBorderRadius: 100.0,
              hoverColor: Colors.grey,
              haptic: true,
              gap: 8,
              tabBackgroundColor: Color.fromARGB(255, 111, 180, 141),
              tabs: [
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Carnet d\'adresse',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Accueil',
                ),
                GButton(icon: Icons.account_circle_outlined, text: 'Profil'),
              ],
            ),
          ),
        ),
      ),
      /*appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35.0),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
              ),
            ),
          ],
        ),
      ),*/
      body: ListView(
        children: [
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                labelText: 'Recherche',
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
                  children: const [
                    BlogBoxWidget(
                        title: 'La ferme de Viandes',
                        imagePath: 'images/test_ferme.png'),
                    BlogBoxWidget(
                        title: 'La ferme de la Crémerie',
                        imagePath: 'images/test_ferme.png'),
                    BlogBoxWidget(
                        title: 'La Ferme de George',
                        imagePath: 'images/test_ferme.png'),
                    BlogBoxWidget(
                        title: 'La Ferme qui ferme',
                        imagePath: 'images/test_ferme.png'),
                    BlogBoxWidget(
                        title: 'Viandes', imagePath: 'images/test_ferme.png'),
                    BlogBoxWidget(
                        title: 'Ferme de Collins',
                        imagePath: 'images/test_ferme.png'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
