import 'package:aifit/core/navigation/utils/route_extensions.dart';
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
                left: 16,
                child: IconButton(
                  icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    context.maybePop();
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
        setState(() {
          cameraOnPause = true;
        });
        logger.i(
            'scanner detects ${barcode.barcodes.length} QR: ${barcode.barcodes.first.rawValue}');
        final experimentId =
            validateExperiment(barcode.barcodes.first.rawValue);
        final sessionId = validateSession(barcode.barcodes.first.rawValue);
        if (experimentId != null) {
          context.pushReplacement('/load-experiment?experimentId=$experimentId');
        } else if (sessionId != null) {
          context.pushReplacement('/session/$sessionId');
        } else {
          setState(() {
            cameraOnPause = false;
          });
        }
      }
    }
  }

  String? validateExperiment(String? text) {
    if (text == null) return null;
    // https://aifit.com/v1/experiment/TEST
    final connectionRegExp = RegExp(
      'https:\/\/aifit\.com\/v1\/experiment\/(.*)+',
      caseSensitive: false,
    );

    try {
      if (connectionRegExp.hasMatch(text)) {
        final match = connectionRegExp.firstMatch(text);
        final experimentId = match?[1];
        return experimentId;
      }
    } catch (ex, st) {
      logger.e('validateExperiment', error: ex, stackTrace: st);
      return null;
    }

    return null;
  }

  String? validateSession(String? text) {
    if (text == null) return null;
    // https://aifit.com/v1/session/TEST
    final connectionRegExp = RegExp(
      'https:\/\/aifit\.com\/v1\/session\/(.*)+',
      caseSensitive: false,
    );

    try {
      if (connectionRegExp.hasMatch(text)) {
        final match = connectionRegExp.firstMatch(text);
        final sessionId = match?[1];
        return sessionId;
      }
    } catch (ex, st) {
      logger.e('validateSession', error: ex, stackTrace: st);
      return null;
    }

    return null;
  }
}
