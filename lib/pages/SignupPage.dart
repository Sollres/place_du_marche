import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/DALL·E background_Inscription.png'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.lightGreen,
//elevation: 0,
              title: Text("S'identifier"),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Inscrivez-vous", style: TextStyle(color: Colors.white)),
                        SizedBox(height: 20),
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Entrez votre nom',
                              hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Entrez votre email',
                              hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Entrez un mot de passe',
                              hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Confirmez le mot de passe',
                              hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                          ),
                          onPressed: () {
// Code pour soumettre le formulaire d'inscription
                          },
                          child: Text("S'inscrire"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}