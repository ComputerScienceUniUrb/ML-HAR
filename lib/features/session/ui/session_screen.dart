import 'package:aifit/core/navigation/utils/route_extensions.dart';
import 'package:aifit/features/session/application/session_player_notifier.dart';
import 'package:aifit/features/session/models/activity_session.dart';
import 'package:aifit/features/session/application/session_notifier.dart';
import 'package:aifit/features/session/models/player.dart';
import 'package:aifit/features/session/ui/widgets/closed_session_widget.dart';
import 'package:aifit/features/session/ui/widgets/draft_session_widget.dart';
import 'package:aifit/features/session/ui/widgets/live_session_widget.dart';
import 'package:aifit/features/session/ui/widgets/opened_session_widget.dart';
import 'package:aifit/features/session/ui/widgets/player_subscription_module_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SessionScreen extends ConsumerWidget {
  final String sessionId;

  const SessionScreen({
    required this.sessionId,
    super.key,
  });

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Uscire dalla sessione?'),
            content: const Text(
                'Sei sicuro di voler tornare alla schermata precedente?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => context.maybePop(false),
                child: const Text('Annulla'),
              ),
              TextButton(
                onPressed: () => context.maybePop(true),
                child: const Text('Conferma'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(getSessionsByIdProvider(sessionId));
    final playerState = ref.watch(sessionPlayerNotifierProvider(sessionId));

    final screenContent = switch (playerState) {
      SessionPlayerLoading() => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      SessionPlayerInitial() => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      SessionPlayerLoaded(:final player) => SessionWidget(
          sessionState: sessionState,
          player: player,
        ),
    };

    // Applica PopScope in modo condizionale per mostrare il dialogo di conferma.
    // Lo facciamo solo quando il giocatore è caricato per evitare popup nelle schermate di caricamento.
    if (playerState is SessionPlayerLoaded &&
        sessionState.valueOrNull?.status != SessionStatus.closed) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) return;

          final bool shouldPop = await _showExitConfirmationDialog(context);
          if (shouldPop && context.mounted) {
            context.maybePop();
          }
        },
        child: screenContent,
      );
    }

    return screenContent;
  }
}

class SessionWidget extends StatelessWidget {
  final AsyncValue<ActivitySession> sessionState;
  final Player? player;

  const SessionWidget({required this.sessionState, this.player, super.key});

  @override
  Widget build(BuildContext context) {
    return switch (sessionState) {
      AsyncLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
      AsyncData(:final value) => switch (value.status) {
          SessionStatus.draft => player == null
              ? PlayerSubscriptionWidget(
                  sessionId: value.id,
                )
              : DraftSessionWidget(
                  session: value,
                  player: player!,
                ),
          SessionStatus.opened => player == null
              ? PlayerSubscriptionWidget(
                  sessionId: value.id,
                )
              : OpenedSessionWidget(
                  session: value,
                ),
          SessionStatus.live => player == null
              ? const NoPlayerWithSessionStarted()
              : LiveSessionWidget(
                  session: value,
                  player: player!,
                ),
          SessionStatus.closed => player == null
              ? const NoPlayerWithSessionStarted()
              : ClosedSessionWidget(
                  session: value,
                ),
        },
      _ => const SizedBox.shrink(),
    };
  }
}

class NoPlayerWithSessionStarted extends StatelessWidget {
  const NoPlayerWithSessionStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Non puoi partecipare ad una sessione già avviata o conclusa.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
