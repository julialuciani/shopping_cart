import 'package:shopping_cart/api_request/mapper/product_mapper.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/api_request/repository/product/product_repository.dart';

class GetAllProductsUsecase {
  final ProductRepository productRepository;
  GetAllProductsUsecase({
    required this.productRepository,
  });

  Future<List<ProductViewData>> execute() async {
    final response = await productRepository.getAllProducts();
    return response.toViewData();
  }
}
