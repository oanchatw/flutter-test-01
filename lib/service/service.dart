import 'package:abc12/model/cloths.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'service.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/products')
  Future<List<Cloth>> getClothes();
}
