class VegiModel {
  final String name;
  final String image;
  final String description;
  final double pricePerKg;
  final String weight;
  final String? category;
  final String location;

  VegiModel({
    required this.name,
    required this.image,
    required this.description,
    required this.pricePerKg,
    required this.weight,
    this.category,
    required this.location,
  });
}
