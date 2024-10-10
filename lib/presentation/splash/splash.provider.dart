import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash.provider.g.dart';

@Riverpod(keepAlive: true)
Future<bool> startUp(StartUpRef ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return false;
}
