import '../api_request/models/product_viewdata.dart';

class CartController {
  static void addQuantity(ProductViewData product) {
    product.quantity++;
  }

  static void subtractQuantity(ProductViewData product) {
    product.quantity--;
  }

  static double calculateTotal(List<ProductViewData> products) {
    double total = 0;
    for (ProductViewData product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }
}
