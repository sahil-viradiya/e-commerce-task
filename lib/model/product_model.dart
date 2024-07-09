import 'dart:convert';

class ProductModel {
  String id;
  String title;
  String price;
  String description;
  String category;
  String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      price: json['price'].toString(),
      description: json['description'].toString(),
      category: json['category'].toString(),
      image: json['image'].toString(),
    );
  }
}
