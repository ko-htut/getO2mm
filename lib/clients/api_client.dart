import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:geto2mm/config/custom_json_converter.dart';
import 'package:geto2mm/constants/configs.dart';
import 'package:geto2mm/interceptors/api_interceptor.dart';
import 'package:geto2mm/interceptors/log_request_interceptor.dart';
import 'package:geto2mm/interceptors/log_response_interceptor.dart';
import 'package:geto2mm/services/api_service.dart';
import 'package:http/io_client.dart' as http;

class APIClient extends ChopperClient {
  APIClient()
      : super(
          baseUrl: Config.baseOtherUrl,
          client: http.IOClient(
            HttpClient()
              ..connectionTimeout = const Duration(
                seconds: Config.httpRequestTimeout,
              ),
          ),
          services: [
          APIService.create(),
          ],
          interceptors: [
            APIInterceptor(),
            LogRequestInterceptor(),
            LogResponseInterceptor(),
          ],
          converter: CustomJsonConverter(),
          errorConverter: CustomJsonConverter(),
        );
}