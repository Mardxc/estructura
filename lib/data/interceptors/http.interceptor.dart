import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http_interceptor/http_interceptor.dart';

class HttpInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw const SocketException(
          'Error de comunicación, intentelo más tarde...');
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    if (response.statusCode == 400) {
      throw Exception('Datos de entrada incorrectos');
    }
    if (response.statusCode == 403) {
      throw Exception('Erro de Algortimo');
    }
    if (response.statusCode == 404) {
      throw Exception('Recurso no Encontrado');
    }
    if (response.statusCode == 409) {
      if (response is Response) {
        throw Exception(
          'Error de Validación',
        );
      }
    }
    if (response.statusCode == 500) {
      throw Exception('Error de Servicios');
    }

    return response;
  }
}
