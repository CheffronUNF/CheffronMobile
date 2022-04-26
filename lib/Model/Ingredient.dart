class Ingredient {
  late String name;
  late int quantity;
  late String unit;

  Ingredient(
      this.name,
      this.quantity,
      this.unit
      );

  Ingredient.fromJson(Map<String, dynamic> json):
        name = json['name'],
        quantity = json['quantity'],
        unit = json['unit'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'unit': unit
  };
}