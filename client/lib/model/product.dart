class Product {
  final int id;
  final String name;
  final String description;
  final String category;
  final Quantity quantity;
  final int currentStock;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    required this.currentStock,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      quantity: Quantity.fromJson(json['quantity']),
      currentStock: json['currentStock'],
      images:
          (json['images'] as String).split(','), // Splitting images by comma
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'quantity': quantity.toJson(),
      'currentStock': currentStock,
      'images': images.join(','), // Joining list of images to a string
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deleted': deleted,
    };
  }
}

class Quantity {
  final int id;
  final int quantity;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Quantity({
    required this.id,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
