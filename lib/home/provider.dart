import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';

final getFilteredProducts = StateProvider<List<ProductViewData>>((ref) => []);
