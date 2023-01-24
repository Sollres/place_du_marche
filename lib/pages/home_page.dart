import 'package:flutter/material.dart';
import 'package:place_du_marche/widgets/box_ferme_widget.dart';
import 'package:place_du_marche/widgets/filtres_widget.dart';

const backgroundColor = Color.fromRGBO(125, 206, 160, 1);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      /*appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
          ),
        ],
      ),*/
      body: ListView(
        children: [
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 5.0),
                child: Wrap(
                  spacing: 10,
                  children: const [
                    BlogBoxWidget(
                        title: 'La ferme de Viandes', imagePath: 'images/meat.png'),
                    BlogBoxWidget(
                        title: 'La ferme de la Crémerie', imagePath: 'images/milk.png'),
                    BlogBoxWidget(
                        title: 'Viandes', imagePath: 'images/meat.png'),
                    BlogBoxWidget(
                        title: 'Viandes', imagePath: 'images/meat.png'),
                    BlogBoxWidget(
                        title: 'Viandes', imagePath: 'images/meat.png'),
                    BlogBoxWidget(
                        title: 'Ferme de Collins', imagePath: 'images/test_ferme.png'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
