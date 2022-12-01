import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:shopping_cart/api_request/endpoints/product/product_endpoint.dart';
import 'package:shopping_cart/api_request/repository/product/product_repository.dart';
import 'package:shopping_cart/api_request/usecase/get_all_products_usecase.dart';
import 'shared/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;
  late ProductEndpoint productEndpoint;
  late GetAllProductsUsecase usecase;
  late ProductRepository repository;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: "queryParameters")));

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    productEndpoint = ProductEndpoint(dioMock);
    repository = ProductRepository(productEndpoint: productEndpoint);
    usecase = GetAllProductsUsecase(productRepository: repository);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getAllProducts(), 200);
  });

  test('WHEN getAllProducts is requested THEN return 200', () async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await usecase.execute();
    verify(() => dioMock.get(any())).called(1);
    expect(result.isNotEmpty, true);
  });
}
