import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'checkbox_state.dart';

class AjouterProduit extends StatefulWidget {
  const AjouterProduit({Key? key}) : super(key: key);

  @override
  _AjouterProduitState createState() => _AjouterProduitState();
}

class _AjouterProduitState extends State<AjouterProduit> {
  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.green,
        value: checkbox.value,
        title: Text(checkbox.title, style: const TextStyle(fontSize: 20)),
        onChanged: (value) => setState(() => checkbox.value = value!),
      );

  final premierChoix = [
    CheckBoxState(title: 'Viandes'),
    CheckBoxState(title: 'Crémerie'),
    CheckBoxState(title: 'Poissons'),
    CheckBoxState(title: 'Vins et spiritieux'),
    CheckBoxState(title: 'Oeufs'),
  ];

  final deuxiemeChoix = [
    CheckBoxState(title: 'AOC (Appellation Origine Controlée)'),
    CheckBoxState(title: 'IGP (Indication Géographique Protégée)'),
    CheckBoxState(title: 'STG (Spécialité Traditionnelle Garantie)'),
    CheckBoxState(title: 'AB (Agriculture Biologique)'),
    CheckBoxState(title: 'Label Rouge'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(LineAwesomeIcons.chevron_circle_left)),
        title: Text("Ajouter un produit",
            style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Saisir le nom du produit"),
                  prefixIcon: Icon(LineAwesomeIcons.fruit_apple)),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Veuillez choisir une catégorie pour le produit : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ...premierChoix.map(buildSingleCheckbox).toList(),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Veuillez choisir un label pour le produit : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ...deuxiemeChoix.map(buildSingleCheckbox).toList(),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 24, 145, 76),
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "Ajouter",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}