import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/api_request/repository/product/product_repository_provider.dart';
import 'package:shopping_cart/api_request/usecase/get_all_products_usecase.dart';

final getAllProductsUsecase = Provider(
  (ref) {
    return GetAllProductsUsecase(
        productRepository: ref.read(productRepositoryProvider));
  },
);

final productsProvider = FutureProvider<List<ProductViewData>>(
  (ref) {
    return ref.read(getAllProductsUsecase).execute();
  },
);
