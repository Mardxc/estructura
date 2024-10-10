import 'package:dataprice/domain/model/request/login.request.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.provider.g.dart';

@riverpod
class ShowPassword extends _$ShowPassword {
  @override
  bool build() {
    return false;
  }

  void obscurePassword(val) => state = val;
}

@riverpod
class Auth extends _$Auth {
  @override
  void build() {
    return;
  }

  Future<bool> login(LoginRequestModel obj) async {
    /*final authService = AuthServices();
    return await authService.login(obj);*/

    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}

@riverpod
Future<bool> login(LoginRef ref, LoginRequestModel obj) async {
  await Future.delayed(const Duration(seconds: 2));
  return true;
}
