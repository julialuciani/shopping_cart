import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/api_request/endpoints/product/product_endpoint.dart';

final productEndpointProvider = Provider(
  (ref) {
    final dio = Dio(
      BaseOptions(baseUrl: 'https://dummyjson.com'),
    );
    return ProductEndpoint(dio);
  },
);
