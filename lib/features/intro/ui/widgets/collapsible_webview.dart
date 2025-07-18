import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Un widget che mostra una Card collassabile con una WebView al suo interno.
/// La WebView viene caricata solo quando la card viene espansa per la prima volta.
class CollapsibleWebView extends StatefulWidget {
  /// Il widget da mostrare nell'header, sempre visibile.
  final Widget header;

  /// L'URL da caricare nella WebView.
  final String url;

  /// L'altezza del contenitore della WebView quando espanso.
  final double expandedHeight;

  const CollapsibleWebView({
    super.key,
    required this.header,
    required this.url,
    this.expandedHeight = 400,
  });

  @override
  State<CollapsibleWebView> createState() => _CollapsibleWebViewState();
}

class _CollapsibleWebViewState extends State<CollapsibleWebView>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  WebViewController? _webViewController;
  bool _isWebViewLoading = true;

  late final AnimationController _animationController;
  late final Animation<double> _iconTurns;

  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  UniqueKey _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = _animationController.drive(_halfTween);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
        _webViewController ??= WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (String url) {
                if (mounted) {
                  setState(() {
                    _isWebViewLoading = false;
                  });
                }
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: _toggleExpansion,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(child: widget.header),
                    RotationTransition(
                        turns: _iconTurns,
                        child: const Icon(Icons.expand_more)),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: _isExpanded
                  ? SizedBox(
                      height: widget.expandedHeight,
                      child: _webViewController == null
                          ? const Center(child: CircularProgressIndicator())
                          : Stack(
                              children: [
                                WebViewWidget(
                                  controller: _webViewController!,
                                  gestureRecognizers: gestureRecognizers,
                                ),
                                if (_isWebViewLoading)
                                  const Center(
                                      child: CircularProgressIndicator()),
                              ],
                            ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
