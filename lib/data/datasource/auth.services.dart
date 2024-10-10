import 'package:dataprice/domain/model/request/login.request.model.dart';
import 'package:dataprice/presentation/shared/remote.routes.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<bool> login(LoginRequestModel obj) async {
    final url = RemoteRoutes();
    final response = await http.post(
      Uri.parse('$url'),
      headers: {'Content-Type': 'Application/json'},
      body: loginRequestModelToJson(obj),
    );

    if (response.statusCode == 200) {
      return true;
    }
    throw Exception('Error en petición');
  }
}
