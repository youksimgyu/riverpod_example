import 'package:chopper/chopper.dart';

part 'chopper_test_service.chopper.dart';

@ChopperApi(baseUrl: '/todo')
abstract class TotoService extends ChopperService {
  static TotoService create(ChopperClient client) => _$TotoService(client);

  @Get()
  Future<Response> getTodos();
}
