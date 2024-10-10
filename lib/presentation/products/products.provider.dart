import 'package:dataprice/domain/model/request/products.capture.request.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products.provider.g.dart';

@riverpod
class ChangeOtraPromocion extends _$ChangeOtraPromocion {
  @override
  bool build() {
    return false;
  }

  void changeValue(val) => state = val;
}

@riverpod
class ChangePromocionSelect extends _$ChangePromocionSelect {
  @override
  String build() {
    return '';
  }

  void changeValue(val) => state = val;
}

@riverpod
Future<String> saveProductCapture(
    SaveProductCaptureRef ref, ProductsCaptureRequestModel obj) async {
  return '';
}
