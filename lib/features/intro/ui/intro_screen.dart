import 'package:aifit/constants.dart';
import 'package:aifit/features/intro/ui/widgets/collapsible_webview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isLastPage = false;
  bool isPrivacyAccepted = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
        _isLastPage = _currentPage == 3;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Salva la preferenza e naviga alla home.
  Future<void> _onFinish() async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('introSeen', true);

    if (mounted) {
      context.go('/');
    }
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossibile aprire $url')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: PageView(
            controller: _pageController,
            children: [
              IntroPage(
                imagePath: 'assets/images/intro_1.png',
                // Sostituisci con le tue immagini
                title: 'Benvenuto in AI Fit!',
                description:
                    'La tua guida personale per un allenamento perfetto e su misura per te.',
              ),
              IntroPage(
                imagePath: 'assets/images/intro_2.png',
                title: 'Monitoraggio Intelligente',
                description:
                    'Il nostro modello apprende dai tuoi test e verifica....',
              ),
              IntroPage(
                imagePath: 'assets/images/intro_3.png',
                title: 'Guadagna WOM',
                description:
                    'Completa le tue sessioni e guadagna ricompense WOM per il tuo impegno.',
              ),
              IntroPage(
                imagePath: 'assets/images/intro_2.png',
                title: 'Privacy Policy',
                description:
                    'Il nostro modello apprende dai tuoi test e verifica....',
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () async {
                          final encodedUrl =
                              Uri.encodeComponent(privacyPolicyUrl);
                          context.push(
                              '/webview?title=Privacy%20Policy&url=$encodedUrl');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child:
                                    Text('Leggi l\'informativa sulla privacy'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () async {
                          final encodedUrl = Uri.encodeComponent(
                              'https://docs.google.com/gview?embedded=true&url=$acceptanceUrl');
                          context.push(
                              '/webview?title=Consenso%20Informato&url=$encodedUrl');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Leggi il consenso'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isPrivacyAccepted,
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              isPrivacyAccepted = value;
                            });
                          },
                        ),
                        Flexible(
                            child: Text('Accetto la privacy policy ecc' * 5)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Elementi fissi in basso (indicatori e pulsanti)
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        height: 150,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Indicatore di pagina
            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            // Pulsante e Privacy
            if (_isLastPage) ...[
              const SizedBox(height: 16),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: isPrivacyAccepted ? _onFinish : null,
                    child: const Text('Inizia Ora'),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ],
            // else
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size.fromHeight(50),
            //   ),
            //   onPressed: () {
            //     _pageController.nextPage(
            //       duration: const Duration(milliseconds: 400),
            //       curve: Curves.easeInOut,
            //     );
            //   },
            //   child: const Text('Avanti'),
            // ),
          ],
        ),
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Widget? child;

  const IntroPage({
    required this.imagePath,
    required this.title,
    required this.description,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assicurati di avere le immagini nel percorso specificato o usa un placeholder
            Image.asset(
              imagePath,
              height: 300,
              errorBuilder: (c, e, s) => const SizedBox(
                height: 300,
                child: Icon(Icons.image, size: 100),
              ),
            ),
            const SizedBox(height: 48),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (child != null)
              child!
            else ...[
              Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
