import 'package:ice_cream_cart/product_store/model/product.dart';

class IceCreamData {
  IceCreamData({this.icecreams});

  IceCreamData.fromJson(Map<String, dynamic> json) {
    if (json['icecreams'] != null) {
      icecreams = <Icecreams>[];
      json['icecreams'].forEach((v) {
        icecreams!.add(Icecreams.fromJson(v as Map<String, dynamic>));
      });
    }
  }
  
  List<Icecreams>? icecreams;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (icecreams != null) {
      data['icecreams'] = icecreams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icecreams implements Product {

  Icecreams({
    this.id,
    this.category,
    this.isFeatured,
    this.flavour,
    this.description,
    this.toppings,
    this.price,
    this.image,
    this.ingredients,
  });

  Icecreams.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    category = json['category'] as String?;
    isFeatured = json['isFeatured'] as bool?;
    flavour = json['flavour'] as String?;
    description = json['description'] as String?;
    toppings = json['toppings'].cast<String>() as List<String>?;
    price = json['price'] as double?;
    image = json['image'] as String?;
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  int? id;
  String? category;
  bool? isFeatured;
  String? flavour;
  String? description;
  List<String>? toppings;
  double? price;
  String? image;
  List<Ingredients>? ingredients;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['isFeatured'] = isFeatured;
    data['flavour'] = flavour;
    data['description'] = description;
    data['toppings'] = toppings;
    data['price'] = price;
    data['image'] = image;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Name: $flavour, Price: $price';
  }
}

class Ingredients {

  Ingredients({this.name, this.quantity});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    quantity = json['quantity'] as String?;
  }

  String? name;
  String? quantity;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    return data;
  }
}
