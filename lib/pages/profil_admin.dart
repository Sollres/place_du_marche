import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:place_du_marche/main.dart';

import 'ajouter_compte.dart';

class PageProfilAdmin extends StatelessWidget {
  const PageProfilAdmin({
    super.key,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  final String nom;
  final String prenom;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(LineAwesomeIcons.chevron_circle_left), color: Colors.black,),
        title: Text("Profile administrateur",
            style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('images/imageAvatar.png')),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(nom, style: Theme.of(context).textTheme.headline4),
                  const SizedBox(width: 10),
                  Text(prenom, style: Theme.of(context).textTheme.headline4),
                ],
              ),
              const SizedBox(height: 10),
              Text(email, style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),

              // Creation du Menu
              ListProfilWidget(
                title: "Créer un compte ",
                icon: LineAwesomeIcons.user_plus,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const AjouterCompte(); 
                      },
                    ),
                  );
                },
              ),
              

              ListProfilWidget(
                title: "Supprimer un compte ",
                icon: LineAwesomeIcons.user_minus,
                onPress: () {},
              ),

              ListProfilWidget(
                title: "Deconnexion",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const MyApp(); //appeler le login page ou le menu principale.
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListProfilWidget extends StatelessWidget {
  const ListProfilWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.green.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey),
            )
          : null,
    );
  }
}