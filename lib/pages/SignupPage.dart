import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:place_du_marche/main.dart';
import 'LoginPage.dart';
import 'home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController mail = new TextEditingController();
  TextEditingController passwordc = new TextEditingController();

  // Création de la fonction pour afficher le popup
  void _showDialog(msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(''),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  Future register() async {
    //print("first print");

    // Validation des champs
    if (user.text.isEmpty || pass.text.isEmpty || mail.text.isEmpty || passwordc.text.isEmpty) {
      _showDialog("Tous les champs sont obligatoires");
      return;
    }

    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(mail.text)) {
      _showDialog("L'adresse mail n'est pas valide");
      return;
    }

    if (pass.text != passwordc.text) {
      _showDialog("Les mots de passe ne correspondent pas");
      return;
    }


    var url = Uri.parse('http://10.0.2.2:80/register.php');

    var response = await http.post(url, body: {
      "username": user.text.toString(),
      "password": pass.text.toString(),
      "email": mail.text.toString()
    });

    if (response.body == "first\"Error\"") {

      _showDialog("Ce mail est déjà utilisé");
    } else {
      print("je suis dans le else");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

    }
  }

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
                          controller: user,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Entrez votre nom',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: mail,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Entrez votre email',
                              hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: pass,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Entrez un mot de passe',
                              hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordc,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
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
                          onPressed: () async {
                            await register();
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