import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class FarmBDD {
  final int id;
  final String nom, producteurs, categorie, produits, adresse, mail, tel, reseaux, description, horaire;
  final bool bio;

  FarmBDD({
    required this.id,
    required this.nom,
    required this.producteurs,
    required this.categorie,
    required this.produits,
    required this.adresse,
    required this.mail,
    required this.tel,
    required this.reseaux,
    required this.description,
    required this.horaire,
    required this.bio,
  });

  factory FarmBDD.fromJson(Map<String, dynamic> jsonData) {
    return FarmBDD(
      id: jsonData['id'],
      nom: jsonData['Nom'],
      producteurs: jsonData['Producteurs'],
      categorie: jsonData['categorie'],
      produits: jsonData['Produits'],
      adresse: jsonData['adresse'],
      mail: jsonData['mail'],
      tel: jsonData['tel'],
      reseaux: jsonData['reseaux'],
      description: jsonData['description'],
      horaire: jsonData['horaire'],
      bio: jsonData['bio'],
    );
  }

}

Future<List<FarmBDD>> downloadJSON() async {
  final jsonEndpoint = "http://localhost:8888/test.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List farms = json.decode(response.body);
    return farms
        .map((farms) => new Spacecraft.fromJson(farms))
        .toList();
  } else{
    throw Exception('We were not able to successfully download the json data.');
  }
}