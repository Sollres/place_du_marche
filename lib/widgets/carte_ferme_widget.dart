import 'package:flutter/material.dart';
import 'package:place_du_marche/models/farm.dart';

import '../pages/fiche_ferme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.farm,
    required this.title,
    required this.imagePath,
  });
  final Farm farm;
  final String title;
  final String imagePath;
  //17:25 video
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return FicheFerme(
                title: title,
                imagePath: imagePath,
                producteur: farm.producteur,
                produits: farm.produits,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        height: 230.0,
        //color: Colors.grey.shade500,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 215.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.grey.shade500,
              ),
              child: Container(
                //Creer widget
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(22)),
              ),
            ),
            Positioned(
              top: 5,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 195.0,
                width: 180.0,
                child: Image.asset(farm.image),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 200.0,
                width: 200,
                child: Column(
                  children: [
                    //const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        farm.title,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    //const Spacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                      child: Text(
                        "Nous vendons cela. Nous vendons cela. Nous vendons cela. Nous vendons cela."
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                      child: Text("Horaire : \n9:00 - 12:00 \n13:00 - 16:00"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
