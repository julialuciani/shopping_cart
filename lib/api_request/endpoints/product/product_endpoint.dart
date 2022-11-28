import 'package:dio/dio.dart';

class ProductEndpoint {
  final Dio _dio;
  ProductEndpoint(this._dio);

  Future<Response> getAllProducts() {
    return _dio.get("/products");
  }
}
