import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

<<<<<<< HEAD
class Profil extends StatelessWidget {
  const Profil({super.key});
=======
class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});
>>>>>>> origin/main

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(125, 206, 160, 1),
      appBar: AppBar(
        title: const Text('Profil & Favoris',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(125, 206, 160, 1),
      ),
      body: Column(
        children: [
          //const SizedBox(height: 10.0), si on utilise pas de app Bar

          Container(
            width: double.infinity,
            height: size.height * 0.25,
            color: const Color.fromRGBO(125, 206, 160, 1),
            child: Row(   /*Permet de travailler sur toute la longueur*/
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundImage: AssetImage('images/profil.png'),
                    backgroundColor: Color.fromRGBO(125, 206, 160, 1),
                  ),
                ),
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BONJOUR Audrey, ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'NOM : Cormier',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'PRENOM : Audrey',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'EMAIL : Cormier.Audrey@mail.com ',
                        style: TextStyle(
<<<<<<< HEAD
                          fontSize: 10.0,
=======
                          fontSize: 15.0,
>>>>>>> origin/main
                          fontWeight: FontWeight.bold,
                        ),
                        //overflow: TextOverflow.fade,
                        //maxLines: 2,
                      ),
                      const SizedBox(
<<<<<<< HEAD
                        height: 10.0,
=======
                        height: 20.0,
>>>>>>> origin/main
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Modifier',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Login Text Clicked');
                            },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(62, 183, 115, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                ),
                /*const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 120),
                  child: Text(
                    'Carnet d\'adresse : ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),*/
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 30),
                    child: Wrap(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 95),
                          child: Text(
                            'Carnet d\'adresse : ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0,),
<<<<<<< HEAD

=======
                        
>>>>>>> origin/main
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 194, 192, 192),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 194, 192, 192),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.symmetric(vertical: 0.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 194, 192, 192),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 194, 192, 192),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}