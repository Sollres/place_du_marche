import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';


class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  _ConnexionState createState() => _ConnexionState();
}


class _ConnexionState extends State<Connexion> {
  TextEditingController mail = new TextEditingController();
  TextEditingController pass = new TextEditingController();

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

  Future login() async {
    var url = Uri.parse('http://10.0.2.2:80/login.php');

    var response = await http.post(url, body: {
      "email": mail.text.toString(),
      "password": pass.text.toString(),
    });
    print("++++++++++response.body ++++++++++++");
    print(response.body );

    if (response.body != "\"Error: Invalid email or password\"") {
      var jsonData = json.decode(response.body);
      //print("+++++++jsonData++++++++");
      //print(jsonData);
      //print("++++++++++FinJD+++++++++++");
      //print("+++++++++++++++jsonData['status']+++++++++++++++++");
      //print(jsonData['id'].runtimeType);

      if (jsonData != null) {
        // Connexion réussie, récupérez l'id de l'utilisateur

        int? userId = int.tryParse(jsonData['id']);
        //print("++++++++++++++ userId++++++++++++++");
        //print('Utilisateur connecté avec l\'id $userId');
        Fluttertoast.showToast(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          msg: 'Vous êtes connecté avec l\'id $userId',
          toastLength: Toast.LENGTH_SHORT,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Connexion échouée
        _showDialog("Il y a une erreur dans le mail ou le mot de passe");
      }
    } else {
      // Erreur de requête
      print('Erreur de requête : ${response.statusCode}');
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
              title: Text("Retour"),
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
                        Text("Connectez-vous", style: TextStyle(color: Colors.white)),
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
                              hintText: 'Entrez votre mot de passe',
                              hintStyle: TextStyle(color: Colors.white)
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                          ),
                          onPressed: () async {
                              await login();
                            },
                          child: Text("Se connecter"),
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