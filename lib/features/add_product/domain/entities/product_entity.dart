import 'dart:io';

class ProductEntity {
  final String name;
  final String description;
  final String code;
  final double price;
  final bool isFeatured;
  final String? imageUrl;
  final File imageFile;

  ProductEntity({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeatured,
    required this.imageFile,
    this.imageUrl,
  });
}
