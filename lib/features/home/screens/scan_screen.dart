import 'package:aifit/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mobile_scanner/mobile_scanner.dart';


class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  MobileScannerController cameraController = MobileScannerController();

  bool cameraOnPause = false;
  double _zoomFactor = 0.0;
  final double _scaleSensitivity = 0.05;

  @override
  void dispose() {
    logger.i('ScanScreen disposed');
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                controller: cameraController,
                onDetect: onDetect,
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                right: 16,
                child: IconButton(
                  icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.clear),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              GestureDetector(
                onScaleUpdate: (details) {
                  _zoomFactor += _scaleSensitivity * (details.scale - 1);
                  _zoomFactor = _zoomFactor.clamp(0.0, 1.0);
                  setState(() {});
                  cameraController.setZoomScale(_zoomFactor);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void onDetect(BarcodeCapture barcode) {
    logger.i('Scanner onDetect new');

    if (!cameraOnPause) {
      if (barcode.barcodes.isNotEmpty) {
        logger.i('scanner detects ${barcode.barcodes.length} QR');

        context.go('/home/load-experiment/${barcode.barcodes.first}');
      }
    }
  }
}
