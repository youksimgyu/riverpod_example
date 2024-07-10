import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class PostApi {
  factory PostApi(Dio dio, {String baseUrl}) = _PostApi;

  @GET('/posts')
  Future<HttpResponse> getPosts();

  @POST('/posts')
  @Header('Content-Type: application/json; charset=UTF-8')
  Future<HttpResponse> postPost(@Body() Map<String, dynamic> body);

  @PUT('/posts/{id}')
  @Header('Content-Type: application/json; charset=UTF-8')
  Future<HttpResponse> putPost(
      @Path('id') String id, @Body() Map<String, dynamic> body);

  @DELETE('/posts/{id}')
  Future<HttpResponse> deletePost(@Path('id') String id);
}
