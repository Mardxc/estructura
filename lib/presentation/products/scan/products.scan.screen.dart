import 'package:dataprice/presentation/shared/theme.user.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ProductsScanScreen extends StatelessWidget {
  const ProductsScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cameraController = MobileScannerController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              color: Colors.white,
              icon: cameraController.torchEnabled
                  ? const Icon(Icons.flash_off, color: ThemeColors.accentColor)
                  : const Icon(Icons.flash_on, color: ThemeColors.accentColor),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
              controller: cameraController,
            ),
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.1,
              child: Container(
                height: size.height * 0.4,
                width: size.width * 0.8,
                color: Colors.white.withOpacity(0.35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
