import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:place_du_marche/pages/profil_page.dart';
import 'package:place_du_marche/widgets/box_ferme_widget.dart';

import 'ChatScreen.dart';
import 'LoginPage.dart';
import 'home_page.dart';

String loc = 'Lieu-dit Les Marais (au bout) 72170 Assé-le-Riboul';
const backgroundColor = Color.fromRGBO(125, 206, 160, 1);
const navBarColor = Color.fromARGB(255, 139, 69, 19);
bool _isVisible = true;
bool _isConnected = false;

class FicheFerme extends StatefulWidget {
  const FicheFerme({
    super.key,
    required this.title,
    required this.imagePath,
    required this.producteur,
    required this.produits,
  });

  final String title;
  final String imagePath;
  final String producteur;
  final String produits;

  @override
  State<FicheFerme> createState() => FicheFermeState();
}

class FicheFermeState extends State<FicheFerme> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 66, 170, 116),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: GNav(
                backgroundColor: Colors.brown,
                tabBorderRadius: 100.0,
                hoverColor: Colors.grey,
                haptic: true,
                gap: 8,
                tabBackgroundColor: Colors.brown.shade300,
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
                            if (_isConnected == true) {
                              return const ChatScreen(userid: null, recid: null,);
                            } else {
                              return LoginPage();
                            } //Mettre la page de chat ici
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
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            buttonArrow(context),
            scroll(),
          ],
        ),
      ),
    );
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 1.0,
        minChildSize: 0.75,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 66, 170, 116),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const ChatScreen(userid: null, recid: null,);
                              },
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.brown,
                          child: Icon(
                            IconlyLight.chat,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      //const Spacer(),
                      const SizedBox(
                        width: 10,
                      ),
                      const CircleAvatar(
                        /* Clique : https://stackoverflow.com/questions/56773800/how-to-add-an-onclick-event-to-an-image-which-is-inside-circleavatar-widget-in-f*/
                        radius: 20,
                        backgroundColor: Colors.brown,
                        child: Icon(
                          IconlyLight.heart,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.producteur,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black54),
                  ), //https://www.youtube.com/watch?v=iZh9Tdhi6MA&t=15s (6:40)
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.amber.shade200,
                        child: const Icon(
                          IconlyLight.location,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(loc),
                    ],
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      color: Colors.grey,
                      height: 250.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Divider(
                      height: 4,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    "Produits",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.produits),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Divider(
                      height: 4,
                      thickness: 2,
                    ),
                  ),
                  //Test
                  Text(
                    "Horaires",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      'Lundi : 9:00 - 15:00\nMardi : Fermé\nMercredi : etc...')
                ],
              ),
            ),
          );
        });
  }

  void changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
}
