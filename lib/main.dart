import 'package:dataprice/presentation/shared/router/app_router.dart';
import 'package:dataprice/presentation/shared/theme.user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Data price',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeUser.buildTheme(Brightness.light),
    );
  }
}
