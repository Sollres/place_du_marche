class Farm {
  final int id;
  final String title, description, image;

  Farm({required this.id, required this.title, required this.description, required this.image});
}

List<Farm> farms = [
  Farm(
    id: 1,
    title: 'La ferme magique', 
    description: "Depuis 1956", 
    image:"images/meat.png",
  ),
  Farm(
    id: 2,
    title: 'La ferme de Collins', 
    description: "Depuis 1996", 
    image:"images/test_ferme.png",
  ),
  Farm(
    id: 1,
    title: 'La ferme de momo',
    description: "Depuis 1976", 
    image:"images/ferme2.png",
  ),
  Farm(
    id: 1,
    title: 'La ferme de fatih',
    description: "Depuis 1986", 
    image:"images/milk.png",
  ),
];