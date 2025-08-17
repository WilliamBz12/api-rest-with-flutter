import 'package:app_test_fiap/app/core/network/response_types/response.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service.dart';
import 'package:dio/dio.dart' hide Response;

class ProductsServiceRemote implements ProductsService {
  Future<void> callApi() async {
    final dio = Dio();

    final result = await dio.get('https://api.escuelajs.co/api/v1/products');
    print('Status: ${result.statusCode}');
    print('Data: ${result.data.toString()}');
  }

  @override
  Future<({List<ProductModel> products, Response result})> getProducts() async {
    final dio = Dio();
    final result = await dio.get('https://api.escuelajs.co/api/v1/products');

    final data = result.data as List;
    final products = data.map((e) => ProductModel.fromJson(e)).toList();

    return (products: products, result: const Success());
  }

  @override
  Future<({ProductModel? product, Response result})> createProduct(
      ProductModel product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<({Response result, bool success})> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<({ProductModel? product, Response result})> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<({ProductModel? product, Response result})> updateProduct(
      int id, ProductModel product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
