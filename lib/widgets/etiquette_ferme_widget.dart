import 'package:flutter/material.dart';

import '../pages/profil_page.dart';

class Etiquette extends StatelessWidget {
  const Etiquette({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Profil();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: size.height * 0.35,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 66, 170, 116),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Text(
                          'Les Petites Pousses ',
                          //maxLines: 20,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Text(
                          'Producteur(s) : Juliette Carrères\n\nContact : ferme.lespetitespousses@gmail.com\n\nProduits : Légumes de saison et dérivés, aromates, fleurs comestibles\n\nadresse : Lieu-dit Les Marais (au bout) 72170 Assé-le-Riboul\n\nMail : ferme.lespetitespousses@gmail.com',
                          //maxLines: 20,
                          softWrap: true,
                        ),
                      ),
                    ),
                    Positioned(right: 0, child: Text('Open!'))
                  ],
                ),
              ),
            ),
          );
  }
}