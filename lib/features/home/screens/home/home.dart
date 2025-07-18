import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIFit'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.pushRoute('/scan');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                MediaQuery.sizeOf(context).width / 1.7,
                MediaQuery.sizeOf(context).width / 1.7,
              ),
              // La forma circolare
              shape: const CircleBorder(),
              // Il padding interno per definire la dimensione del cerchio
              padding: const EdgeInsets.all(20),
              // (Opzionale) Colori personalizzati
              backgroundColor: Colors.blue,
              // Colore di sfondo
              foregroundColor: Colors.white, // Colore dell'icona
            ),
            child: const Icon(
              Icons.qr_code_2,
              size: 100,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Scansiona il QR-Code',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Center(child: Text('oppure')),
          TextButton(
              onPressed: () {
                context.pushRoute('/load-experiment');
              },
              child: Text('Avvia un esperimento da un codice identificativo')),
          const SizedBox(height: kBottomNavigationBarHeight),
          /*Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: NavItem(
                  text: 'Test generico',
                  path: '/home/set-test',
                ),
              ),
              Expanded(
                child: NavItem(
                  text: 'Scansiona QR-Code',
                  path: '/home/scan',
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: NavItem(
                  text: 'Da codice esperimento',
                  path: '/home/load-experiment',
                ),
              ),
            ],
          ),
          NavItem(
            text: 'I tuoi WOM',
            path: '/home/wom',
          ),
          NavItem(
            text: 'Le mie sessioni',
            path: '/home/sessions',
          ),*/
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;
  final String path;
  final Function()? onTap;

  const NavItem({
    required this.text,
    required this.path,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: () {
          context.pushRoute(path);
        },
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Card(
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}
