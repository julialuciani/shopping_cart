import 'package:shopping_cart/api_request/models/product_viewdata.dart';

import '../response/products/get_all_products_response.dart';

extension ProductMapper on GetAllProductsResponse {
  List<ProductViewData> toViewData() {
    return products
        .map((product) => ProductViewData(
              id: product.id,
              brand: product.brand,
              category: product.category,
              description: product.description,
              discountPercentage: product.discountPercentage,
              images: product.images,
              price: product.price,
              rating: product.rating,
              stock: product.stock,
              thumbnail: product.thumbnail,
              title: product.title,
            ))
        .toList();
  }
}
