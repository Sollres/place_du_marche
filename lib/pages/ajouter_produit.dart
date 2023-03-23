import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:test/checkbox_state.dart';

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
    CheckBoxState(title: 'Ouefs'),
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
      body: Column(
        
        children: [
          ...premierChoix.map(buildSingleCheckbox).toList(),
          const SizedBox(height: 20),


          ...deuxiemeChoix.map(buildSingleCheckbox).toList(),
        ],
      ),
    );
  }
}
