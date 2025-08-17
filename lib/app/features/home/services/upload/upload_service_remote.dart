import 'dart:io';

import 'package:app_test_fiap/app/core/client/api_client.dart';
import 'package:app_test_fiap/app/core/network/response_types/response.dart';
import 'package:app_test_fiap/app/features/home/services/upload/upload_service.dart';
import 'package:dio/dio.dart' hide Response;

class UploadServiceRemote implements UploadService {
  @override
  Future<({String? imageUrl, Response result})> uploadImage(
      File imageFile) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
    });

    final result = await ApiClient.client.post(
      '/api/v1/files/upload',
      data: form,
    );

    final imageUrl = result.data['location'].toString();

    return (imageUrl: imageUrl, result: const Success());
  }
}
