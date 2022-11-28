import 'package:shopping_cart/api_request/endpoints/product/product_endpoint.dart';

import '../../response/products/products_response.dart';

class ProductRepository {
  final ProductEndpoint productEndpoint;
  ProductRepository({
    required this.productEndpoint,
  });

  Future<ProductsResponse> getAllProducts() async {
    final products = await productEndpoint.getAllProducts();
    return ProductsResponse.fromJson(products.data);
  }
}
