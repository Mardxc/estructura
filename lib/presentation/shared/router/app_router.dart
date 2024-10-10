import 'package:dataprice/presentation/auth/auth.screen.dart';
import 'package:dataprice/presentation/home/home.screen.dart';
import 'package:dataprice/presentation/jerarquia/capture/jerarquia.capture.screen.dart';
import 'package:dataprice/presentation/products/capture/products.capture.screen.dart';
import 'package:dataprice/presentation/products/scan/products.scan.screen.dart';
import 'package:dataprice/presentation/splash/splash.screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/products-capture',
        builder: (context, state) => ProductsCaptureScreen(),
      ),
      GoRoute(
        path: '/products-scan',
        builder: (context, state) => const ProductsScanScreen(),
      ),
      GoRoute(
        path: '/jerarquia-scan',
        builder: (context, state) => JerarquiaCaptureScreen(),
      ),
    ],
  );
}
