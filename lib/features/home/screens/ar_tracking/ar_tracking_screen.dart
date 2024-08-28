import 'package:aifit/features/home/screens/ar_tracking/application/ar_data_provider.dart';
import 'package:aifit/features/home/screens/ar_tracking/application/ar_stream_provider.dart';
import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:aifit/features/home/core/navigation/records_route.dart';
import 'package:aifit/features/home/screens/widgets/activity_confidence_extension.dart';
import 'package:aifit/features/home/screens/widgets/record_tile.dart';
import 'package:aifit/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ARTrackingScreen extends StatelessWidget {
  const ARTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Test'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          RealTimeActivityWidget(),
          TodayRecords(),
          DailyRecords(),
        ],
      ),
    );
  }
}

class RealTimeActivityWidget extends ConsumerWidget {
  const RealTimeActivityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(activityErrorNotifierProvider, (p, n) {
      if (n != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(n)));
      }
    });
    final state = ref.watch(activityNotifierProvider);
    final text = state is ActivityStateData ? 'STOP' : 'START';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () async {
            final res = await isPermissionGrants();
            if (res) {
              if (state is ActivityStateData) {
                ref.read(activityNotifierProvider.notifier).stop();
              } else {
                ref.read(activityNotifierProvider.notifier).start();
              }
            }
          },
          child: Text(text),
        ),
        const SizedBox(height: 32),
        if (state is ActivityStateData && state.activity != null) ...[
          Card(
            color: state.activity!.confidence.color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    state.activity!.type.name.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Confidence: ${state.activity!.confidence.name.toString()}',
                  ),
                  const SizedBox(height: 16),
                  Text('Timestamp: ${state.timestamp?.toString()}'),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class TodayRecords extends ConsumerWidget {
  const TodayRecords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getDailyRecordsProvider).valueOrNull ?? [];
    final filtered = state.take(5);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Daily records'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.pushRoute(
                      '/ar-tracking/records',
                      extra: RecordsArgumentsRoute(
                        records: state,
                        dateTime: DateTime.now(),
                      ),
                    );
                  },
                  child: const Text('View all'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < filtered.length; i++)
              RecordTile(
                record: filtered.elementAt(i),
              ),
          ],
        ),
      ),
    );
  }
}

class DailyRecords extends ConsumerWidget {
  const DailyRecords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getAggregatedDayProvider).valueOrNull ?? {};
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Records per day'),
            const SizedBox(height: 16),
            for (final key in state.keys)
              ListTile(
                onTap: () {
                  context.pushRoute(
                    '/ar-tracking/records',
                    extra: RecordsArgumentsRoute(
                      records: state[key] ?? [],
                      dateTime: key,
                    ),
                  );
                },
                title: Text(format.format(key)),
                trailing: Text(state[key]?.length.toString() ?? '0'),
              ),
          ],
        ),
      ),
    );
  }
}
