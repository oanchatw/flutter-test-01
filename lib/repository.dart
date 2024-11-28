import 'package:abc12/model/cloths.dart';
import 'package:abc12/service/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Repository {
  static RestClient? _client;

  static RestClient get client {
    if (_client == null) {
      Dio dio = Dio()
        // ..options = BaseOptions(
        //   connectTimeout: const Duration(milliseconds: 5000),
        //   sendTimeout: const Duration(milliseconds: 7000),
        //   receiveTimeout: const Duration(milliseconds: 8000),
        //   contentType: Headers.jsonContentType,
        // )
        ..interceptors.addAll([
          LogInterceptor(
            requestBody: true,
            responseHeader: false,
            responseBody: true,
            logPrint: (obj) {
              debugPrint(obj.toString());
            },
          ),
        ]);

      _client = RestClient(
        dio,
      );
    }
    return _client!;
  }

  static Future<List<Cloth>> getCloths() async => await client.getClothes();
}
