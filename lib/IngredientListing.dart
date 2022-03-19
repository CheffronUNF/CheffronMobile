class IngredientListing {
  late String name;
  late int quantity;
  late String unit;

  IngredientListing(
      this.name,
      this.quantity,
      this.unit
      );

  IngredientListing.fromJson(Map<String, dynamic> json):
        name = json['name'],
        quantity = json['quantity'],
        unit = json['unit'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'unit': unit
  };
}