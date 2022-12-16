import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';

final cartProvider = StateProvider<List<ProductViewData>>((ref) => []);

final numberOfProducts = StateProvider((ref) => 0);
