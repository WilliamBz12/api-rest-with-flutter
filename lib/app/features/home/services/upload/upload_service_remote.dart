import 'dart:io';

import 'package:app_test_fiap/app/core/api/api_adapter.dart' hide Response;
import 'package:app_test_fiap/app/core/network/response_types/response.dart';
import 'package:app_test_fiap/app/features/home/services/upload/upload_service.dart';
import 'package:dio/dio.dart' hide Response;

class UploadServiceRemote implements UploadService {
  final ApiClientAdapter client;
  UploadServiceRemote({required this.client});

  @override
  Future<({String? imageUrl, Response result})> uploadImage(
      File imageFile) async {
    try {
      final form = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
      });

      final result = await client.post(
        path: '/api/v1/files/upload',
        data: form,
      );

      final imageUrl = result.data['location'].toString();

      return (imageUrl: imageUrl, result: const Success());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return (
          imageUrl: null,
          result: const GeneralFailure(message: 'Erro nos dados enviados')
        );
      } else if (e.response?.statusCode == 404) {
        return (
          imageUrl: null,
          result: const GeneralFailure(message: 'Produtos não encontrados')
        );
      }
      return (imageUrl: null, result: const GeneralFailure());
    } catch (e) {
      return (imageUrl: null, result: const GeneralFailure());
    }
  }
}
