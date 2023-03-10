import 'package:flutter/material.dart';
import 'package:place_du_marche/pages/fiche_ferme.dart';

String desc = 'La ferme de Collins est un héritage familiale depuis 1576.';

class BlogBoxWidget extends StatelessWidget {
  const BlogBoxWidget({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

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
                description: desc,
              );
            },
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(
                5,
                5,
              ),
            )
          ],
        ),
        child: Column(
          children: [
            Image.asset(imagePath, width: 200.0, height: 200.0,),
            ListTile(
              title: Text(title),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }
}
