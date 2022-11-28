import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';
import 'package:shopping_cart/api_request/endpoints/product/product_endpoint.dart';
import 'package:shopping_cart/api_request/repository/product/product_repository.dart';

import 'shared/api_factory.dart';

class ProductEndpointMock extends Mock implements ProductEndpoint {}

void main() {
  late ProductEndpointMock productEndpointMock;
  late ProductRepository productRepository;

  setUp(() {
    productEndpointMock = ProductEndpointMock();
    productRepository = ProductRepository(productEndpoint: productEndpointMock);
  });

  test(
      'WHEN getAllProducts is requested by ProductRepository THEN getAllProducts from ProductEndpoint',
      () async {
    when((() => productEndpointMock.getAllProducts())).thenAnswer((_) async =>
        Response(
            data: ApiFactory.getAllProducts(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await productRepository.getAllProducts();
    verify(() => productEndpointMock.getAllProducts()).called(1);
  });
}
