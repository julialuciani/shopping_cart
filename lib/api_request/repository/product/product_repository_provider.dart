import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/api_request/endpoints/product/product_endpoint_provider.dart';
import 'package:shopping_cart/api_request/repository/product/product_repository.dart';

final productRepositoryProvider = Provider(
  (ref) {
    return ProductRepository(
        productEndpoint: ref.read(productEndpointProvider));
  },
);
