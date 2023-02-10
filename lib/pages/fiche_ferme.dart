import 'package:flutter/material.dart';

String desc = 'La ferme de Collins est un héritage familiale depuis 1576.';
const backgroundColor = Color.fromRGBO(125, 206, 160, 1);

class FicheFerme extends StatelessWidget {
  const FicheFerme({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  final String title;
  final String imagePath;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: 250.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              //borderRadius: BorderRadius.circular(22),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/ferme2.png")),
              //color: Colors.grey.shade500,
            ),
          ),
        ]),
      ),
    );
  }
}
