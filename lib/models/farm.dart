class Farm {
  final int id;
  final String title, producteur, image, categorie, produits, reseau, email;

  Farm({required this.id, required this.title, required this.producteur, required this.image, required this.categorie, required this.produits, required this.reseau, required this.email});
}

List<Farm> farms = [
  Farm(
    id: 1,
    title: 'Les Petites Pousses', 
    producteur: "Juliette Carrères", 
    image:"images/test_ferme.png",
    categorie: "Fruits et légumes",
    produits: "Légumes de saison et dérivés, aromates, fleurs comestibles",
    reseau: "https://www.facebook.com/PetitesPousses/",
    email: "ferme.lespetitespousses@gmail.com",
  ),
  Farm(
    id: 2,
    title: 'Le Jardin de la Corne', 
    producteur: "Perrine Guinet, Jérome Gilouppe", 
    image:"images/test_ferme.png",
    categorie: "Fruits et légumes",
    produits: "Légumes de saison, shiitakés, pleurotes, endives.",
    reseau: "https://www.facebook.com/lejardindelacorne",
    email: "lejardindelacorne@gmail.com",
  ),
  Farm(
    id: 3,
    title: 'Vivaces', 
    producteur: "Nelly Choplain", 
    image:"images/test_ferme.png",
    categorie: "Fruits et légumes",
    produits: "Plants maraîchers, plantes aromatiques et fleurs comestibles, fraises et petits fruits.",
    reseau: "",
    email: "sauvagecultivee@gmail.com",
  ),
  Farm(
    id: 4,
    title: 'La Ferme du Beury', 
    producteur: "Florent Rouillard", 
    image:"images/ferme2.png",
    categorie: "Fruits et légumes",
    produits: "Légumes de saison.",
    reseau: "", 
    email: "fermedubeury@gmail.com",
  ),
  Farm(
    id: 5,
    title: 'Ferme de la Moncesière', 
    producteur: "Éloïse de Beaucourt, Clément Sebille", 
    image:"images/ferme2.png",
    categorie: "Fruits et légumes",
    produits: "Légumes diversifiés de saison, confitures, coulis de tomates,jus de pomme.",
    reseau: "",
    email: "lamoncesiere@gmail.com",
  ),
];