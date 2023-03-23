import 'package:flutter/material.dart';
import 'package:place_du_marche/pages/fiche_ferme.dart';

import '../models/farm.dart';

class Etiquette extends StatelessWidget {
  const Etiquette({
    super.key,
    required this.farm,
  });

  final Farm farm;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return FicheFerme(title: farm.title, imagePath: farm.image, producteur: farm.producteur,produits: farm.produits,);
              },
            ),
          );
        },
        child: AspectRatio(
              aspectRatio: 1.65,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 66, 170, 116),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              farm.title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              farm.categorie,
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              farm.producteur,
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              farm.produits,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    AspectRatio(
                      aspectRatio: 0.71,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          farm.image,
                          fit: BoxFit.cover,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
