import 'package:aifit/app/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WomDetailsScreen extends ConsumerWidget {
  final WomTransaction womTransaction;

  const WomDetailsScreen({
    required this.womTransaction,
    super.key,
  });

  Future<void> openWomPocket() async {
    final uri = Uri.parse(womTransaction.womLink);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Dettaglio WOM')),
      body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Congratualazioni',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 24),
            Text(
              'Con questa transazione puoi ottenere ${womTransaction.womCount} WOM, apri il Wom Pocket...',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Center(
              child: InkWell(
                onTap: openWomPocket,
                child: QrImageView(
                  size: 200,
                  data: womTransaction.womLink,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'PIN',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              womTransaction.womPin,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: openWomPocket,
                child: Text('Apri WomPocket'),
              ),
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) {
                return TextButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: womTransaction.womLink),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${womTransaction.womLink} copiato negli appunti'),
                      ),
                    );
                  },
                  child: Text(womTransaction.womLink),
                );
              },
            )
          ]),
    );
  }
}
