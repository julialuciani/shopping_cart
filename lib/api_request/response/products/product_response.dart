import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
  ProductResponse(
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  );

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllProductsResponseToJson(this);
}
