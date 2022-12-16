import 'package:shopping_cart/api_request/models/product_viewdata.dart';

class FakeRepository {
  static Future<List<ProductViewData>> getAllProducts() async {
    Future<List<ProductViewData>> allProducts =
        Future.delayed(Duration.zero, () {
      return [first, second];
    });
    return allProducts;
  }
}

ProductViewData first = ProductViewData(
    id: 0,
    title: 'title',
    description: 'description',
    price: 0,
    discountPercentage: 0,
    rating: 0,
    stock: 0,
    brand: 'brand',
    category: 'category',
    thumbnail: 'thumbnail',
    images: ["https://i.dummyjson.com/data/products/4/1.jpg"]);
ProductViewData second = ProductViewData(
    id: 0,
    title: 'title',
    description: 'description',
    price: 0,
    discountPercentage: 0,
    rating: 0,
    stock: 0,
    brand: 'brand',
    category: 'category',
    thumbnail: 'thumbnail',
    images: [
      "https://i.dummyjson.com/data/products/4/1.jpg",
    ]);
