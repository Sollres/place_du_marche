import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'checkbox_state.dart';

class AjouterProduit extends StatefulWidget {
  const AjouterProduit({Key? key}) : super(key: key);

  @override
  State<AjouterProduit> createState() => _AjouterProduitState();
}

class _AjouterProduitState extends State<AjouterProduit> {
  String selected = "";
  String? selectedValue = '';

  List ChoixCategorie = [
    {
      "id": 0,
      "value": false,
      "title": "Viande",
    },
    {
      "id": 1,
      "value": false,
      "title": "Crémerie",
    },
    {
      "id": 2,
      "value": false,
      "title": "Poissons",
    },
    {
      "id": 3,
      "value": false,
      "title": "Vins et spiritieux",
    },
    {
      "id": 4,
      "value": false,
      "title": "Oeufs",
    },
  ];

  List ChoixLabel = [
    {
      "id": 0,
      "value": false,
      "title": "AOC (Appellation Origine Controlée)",
    },
    {
      "id": 1,
      "value": false,
      "title": "IGP (Indication Géographique Protégée)",
    },
    {
      "id": 2,
      "value": false,
      "title": "STG (Spécialité Traditionnelle Garantie)",
    },
    {
      "id": 3,
      "value": false,
      "title": "AB (Agriculture Biologique)",
    },
    {
      "id": 4,
      "value": false,
      "title": "Label Rouge",
    },
    {
      "id": 5,
      "value": false,
      "title": "Aucun",
    },
  ];

  List ChoixViande = [
    {
      "id": 0,
      "value": false,
      "title": "Viande Blanche",
    },
    {
      "id": 1,
      "value": false,
      "title": "Viande Rouge",
    },
  ];

  var choixViande = {
    "Boeuf": false,
    "Poulet": false,
    "Porc": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(LineAwesomeIcons.chevron_circle_left), color: Colors.black),
        title: Text("Ajouter un produit",
            style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Saisir le nom du produit"),
                  prefixIcon: Icon(LineAwesomeIcons.fruit_apple)),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Veuillez choisir une catégorie pour le produit : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                ChoixCategorie.length,
                (index) {
                  if (ChoixCategorie[index]["title"] == "Viande") {
                    // Display the "Viande" tile and its sub-menu
                    return Column(
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            ChoixCategorie[index]["title"],
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          value: ChoixCategorie[index]["value"],
                          onChanged: (value) {
                            setState(() {
                              ChoixCategorie[index]["value"] = value;
                              if (!value!) {
                                // If the "Viande" tile is unchecked, uncheck the sub-options
                                selectedValue = null;
                              }
                            });
                          },
                        ),
                        if (ChoixCategorie[index]["value"])
                          Column(
                            children: [
                              RadioListTile(
                                title: const Text("Viande Rouge"),
                                value: "Boeuf",
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text("Poulet"),
                                value: "Poulet",
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                              ),
                            ],
                          ),
                      ],
                    );
                  } else {
                    // Display the other tiles as before
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        ChoixCategorie[index]["title"],
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      value: ChoixCategorie[index]["value"],
                      onChanged: (value) {
                        setState(() {
                          for (var element in ChoixCategorie) {
                            element["value"] = false;
                          }
                          ChoixCategorie[index]["value"] = value;
                          selectedValue =
                              ChoixCategorie[index]["title"] as String;
                        });
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "Veuillez choisir un Lable pour le produit : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: true,
              child: Column(
                children: List.generate(
                  ChoixLabel.length,
                  (index) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      ChoixLabel[index]["title"],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    value: ChoixLabel[index]["value"],
                    onChanged: (value) {
                      setState(() {
                        for (var element in ChoixLabel) {
                          element["value"] = false;
                        }
                        ChoixLabel[index]["value"] = value;
                        selected =
                            "${ChoixLabel[index]["id"]}, ${ChoixLabel[index]["title"]}, ${ChoixLabel[index]["value"]}";
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 190, 100),
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "Ajouter",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
