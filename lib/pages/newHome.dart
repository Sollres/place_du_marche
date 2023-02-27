import 'package:flutter/material.dart';

const backgroundColor = Color.fromRGBO(125, 206, 160, 1);

class NewHome extends StatelessWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Modif Home page',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(125, 206, 160, 1),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Container(
              width: double.infinity,
              height: size.height * 0.35,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 117, 146, 131),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                    'Voici la ferme numéro $index \n\nElle est ouverte de $index h à $index h'),
              ),
            ),
          );
        },
      ),
    );
  }
}
