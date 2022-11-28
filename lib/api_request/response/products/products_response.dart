import 'package:json_annotation/json_annotation.dart';

import 'package:shopping_cart/api_request/response/products/get_all_products_response.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final List<GetAllProductsResponse> products;

  ProductsResponse(
    this.products,
  );

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
