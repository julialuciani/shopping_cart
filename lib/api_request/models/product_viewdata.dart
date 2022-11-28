import 'package:decimal/decimal.dart';

class ProductViewData {
  int id;
  String title;
  String description;
  Decimal price;
  Decimal discountPercentage;
  Decimal rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  ProductViewData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
}
