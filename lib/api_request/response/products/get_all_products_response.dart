import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_cart/api_request/response/products/product_response.dart';

part 'get_all_products_response.g.dart';

@JsonSerializable()
class GetAllProductsResponse {
  final List<ProductResponse> products;

  GetAllProductsResponse(
    this.products,
  );

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
