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

class SessionScreen extends ConsumerWidget {
  final String sessionId;

  const SessionScreen({
    required this.sessionId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(getSessionsByIdProvider(sessionId));
    final playerState = ref.watch(sessionPlayerNotifierProvider(sessionId));
    return switch (playerState) {
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
    return const Text('Non puoi partecipare ad una session già avviata');
  }
}
