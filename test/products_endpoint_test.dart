import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:shopping_cart/api_request/endpoints/product/product_endpoint.dart';
import 'shared/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;
  late ProductEndpoint productEndpoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: "queryParameters")));

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    productEndpoint = ProductEndpoint(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getAllProducts(), 200);
  });

  test('WHEN getAllProducts is requested THEN return 200', () async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await productEndpoint.getAllProducts();
    expect(result.statusCode, equals(200));
    expect(result, sucess);
  });
}
