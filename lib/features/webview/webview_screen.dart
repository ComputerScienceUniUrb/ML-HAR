import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Una schermata generica per visualizzare una pagina web tramite una WebView.
/// Mostra un indicatore di caricamento mentre la pagina è in fase di caricamento.
class WebViewScreen extends StatefulWidget {
  /// Il titolo da mostrare nell'AppBar della schermata.
  final String title;

  /// L'URL della pagina web da caricare.
  final String url;

  const WebViewScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            // Gestisci qui gli errori di caricamento, se necessario.
            // Ad esempio, mostrando una SnackBar o una schermata di errore.
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          // Mostra l'indicatore di caricamento solo se _isLoading è true
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}