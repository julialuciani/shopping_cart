import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart/api_request/response/products/get_all_products_response.dart';
import 'package:shopping_cart/api_request/response/products/product_response.dart';

void main() {
  test('WHEN ProductResponse.json THEN confirm expectations', () async {
    ProductResponse productResponse =
        ProductResponse(1, '', '', 0, 0, 0, 0, '', '', '', ['']);
    expect(productResponse.toJson(), {
      "id": 1,
      "title": "",
      "description": "",
      "price": 0,
      "discountPercentage": 0,
      "rating": 0,
      "stock": 0,
      "brand": "",
      "category": "",
      "thumbnail": "",
      "images": [""],
    });
  });
  test('WHEN GetAllProducts.json THEN confirm expectations', () async {
    GetAllProductsResponse getAllProductsResponse =
        GetAllProductsResponse([productResponse]);
    expect(getAllProductsResponse.toJson().toString(),
        '{products: [Instance of \'ProductResponse\']}');
  });
}

ProductResponse productResponse =
    ProductResponse(1, '', '', 0, 0, 0, 0, '', '', '', ['']);
