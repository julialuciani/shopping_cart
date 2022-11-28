import 'package:shopping_cart/api_request/endpoints/product/product_endpoint.dart';

import '../../response/products/get_all_products_response.dart';

class ProductRepository {
  final ProductEndpoint productEndpoint;
  ProductRepository({
    required this.productEndpoint,
  });

  Future<GetAllProductsResponse> getAllProducts() async {
    final products = await productEndpoint.getAllProducts();
    return GetAllProductsResponse.fromJson(products.data);
  }
}
