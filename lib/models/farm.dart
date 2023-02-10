class Farm {
  final int id;
  final String title, description, image;

  Farm({required this.id, required this.title, required this.description, required this.image});
}

List<Farm> farms = [
  Farm(
    id: 1,
    title: 'La ferme magique', 
    description: "\"La Ferme Magique\" est une exploitation agricole qui se distingue par ses méthodes de culture innovantes et durables. Elle utilise des techniques écologiques pour cultiver des fruits et légumes de qualité supérieure, tout en préservant l'environnement. La ferme propose également des activités pour les familles, telles que des visites guidées et des ateliers pour enfants, pour sensibiliser les plus jeunes à l'importance de l'agriculture durable. Les visiteurs peuvent également déguster les produits de la ferme, cueillis à maturité, pour apprécier la saveur unique de la nourriture cultivée de manière responsable. La Ferme Magique, c'est une expérience agricole immersive et éducative pour tous les âges.", 
    image:"images/meat.png",
  ),
  Farm(
    id: 2,
    title: 'La ferme de Collins', 
    description: "\"La Ferme de Collins\" est une exploitation agricole familiale traditionnelle située dans un environnement paisible et verdoyant. Fiers de leurs racines agricoles, les propriétaires cultivent une variété de produits frais et de qualité, tels que des fruits, des légumes, du bétail et des céréales. Ils utilisent des méthodes de culture traditionnelles pour produire des aliments sains et savoureux, en harmonie avec la nature. La ferme accueille également les visiteurs pour des visites guidées, des activités pour enfants et des dégustations de produits locaux. À \"La Ferme de Collins\", les visiteurs peuvent découvrir le mode de vie rural authentique et renouer avec leurs racines agricoles tout en appréciant les produits frais de la ferme.", 
    image:"images/test_ferme.png",
  ),
  Farm(
    id: 1,
    title: 'La ferme de merde', 
    description: "La Ferme de merde est une exploitation agricole respectueuse de l'environnement qui se consacre à la production de fruits et légumes de qualité supérieure. Située dans un cadre paisible et rural, la ferme se concentre sur la culture durable de ses produits sans utiliser de pesticides nocifs. Les fruits et légumes frais sont vendus directement aux consommateurs via un stand de ferme, garantissant ainsi la fraîcheur et la qualité des produits.", 
    image:"images/ferme2.png",
  ),
  Farm(
    id: 1,
    title: 'La ferme futuriste', 
    description: "La Ferme Futuriste est une exploitation agricole innovante et orientée vers l'avenir. Elle utilise les dernières technologies et méthodes durables pour cultiver des fruits, légumes et autres produits alimentaires de qualité supérieure. La ferme est équipée d'installations avancées telles que des serres intelligentes, des systèmes de gestion de l'eau et de l'énergie, ainsi que des robots et des drones pour maximiser l'efficacité et la productivité. Tout en garantissant un impact environnemental minimal, La Ferme Futuriste vise à fournir des aliments sains et abordables aux consommateurs locaux.", 
    image:"images/milk.png",
  ),
];