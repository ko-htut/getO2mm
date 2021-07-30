import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class APIService extends ChopperService {
  static APIService create([ChopperClient? client]) => _$APIService(client);

}
