import 'package:app_test_fiap/app/core/api/api_adapter.dart' hide Response;
import 'package:app_test_fiap/app/core/network/response_types/response.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service.dart';
import 'package:dio/dio.dart' hide Response;

class ProductsServiceRemote implements ProductsService {
  final ApiClientAdapter client;

  ProductsServiceRemote({required this.client});

  @override
  Future<({List<ProductModel> products, Response result})> getProducts() async {
    try {
      final result = await client.get(path: '/api/v1/products');
      final data = result.data as List;
      final products = data.map((e) => ProductModel.fromJson(e)).toList();

      return (products: products, result: const Success());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return (
          products: <ProductModel>[],
          result: const GeneralFailure(message: 'Erro nos dados enviados')
        );
      } else if (e.response?.statusCode == 404) {
        return (
          products: <ProductModel>[],
          result: const GeneralFailure(message: 'Produtos não encontrados')
        );
      }
      return (products: <ProductModel>[], result: const GeneralFailure());
    } catch (e) {
      return (products: <ProductModel>[], result: const GeneralFailure());
    }
  }

  @override
  Future<({ProductModel? product, Response result})> createProduct(
    ProductModel product,
  ) async {
    try {
      await client.post(
        path: '/api/v1/products',
        data: product.toJson(),
      );
      return (product: product, result: const Success());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return (
          product: null,
          result: const GeneralFailure(message: 'Erro nos dados enviados')
        );
      } else if (e.response?.statusCode == 404) {
        return (
          product: null,
          result: const GeneralFailure(message: 'Produto não encontrado')
        );
      }
      return (product: null, result: const GeneralFailure());
    } catch (e) {
      return (product: null, result: const GeneralFailure());
    }
  }

  @override
  Future<({Response result, bool success})> deleteProduct(int id) async {
    try {
      await client.delete(path: '/api/v1/products/$id');
      return (result: const Success(), success: true);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return (
          success: false,
          result: const GeneralFailure(message: 'Erro nos dados enviados')
        );
      } else if (e.response?.statusCode == 404) {
        return (
          success: false,
          result: const GeneralFailure(message: 'Produto não encontrado')
        );
      }
      return (success: false, result: const GeneralFailure());
    } catch (e) {
      return (success: false, result: const GeneralFailure());
    }
  }

  @override
  Future<({ProductModel? product, Response result})> getProduct(int id) async {
    try {
      final result = await client.get(path: '/api/v1/products/$id');
      final product = ProductModel.fromJson(result.data);
      return (product: product, result: const Success());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return (
          product: null,
          result: const GeneralFailure(message: 'Erro na chamada')
        );
      } else if (e.response?.statusCode == 404) {
        return (
          product: null,
          result: const GeneralFailure(message: 'Produto não encontrado')
        );
      }
      return (product: null, result: const GeneralFailure());
    } catch (e) {
      return (product: null, result: const GeneralFailure());
    }
  }

  @override
  Future<({ProductModel? product, Response result})> updateProduct(
    int id,
    ProductModel product,
  ) async {
    try {
      await client.put(
        path: '/api/v1/products/$id',
        data: product.toJson(),
      );

      return (product: product, result: const Success());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return (
          product: null,
          result: const GeneralFailure(message: 'Erro nos dados enviados')
        );
      } else if (e.response?.statusCode == 404) {
        return (
          product: null,
          result: const GeneralFailure(message: 'Produto não encontrado')
        );
      }
      return (product: null, result: const GeneralFailure());
    } catch (e) {
      return (product: null, result: const GeneralFailure());
    }
  }
}
