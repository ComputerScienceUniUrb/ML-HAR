import 'package:aifit/features/wom/application/wom_notifier.dart';
import 'package:aifit/features/wom/application/wom_transactions_notifier.dart';
import 'package:aifit/features/wom/domain/wom_repository.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WomScreen extends ConsumerStatefulWidget {
  const WomScreen({super.key});

  @override
  ConsumerState<WomScreen> createState() => _WomScreenState();
}

class _WomScreenState extends ConsumerState<WomScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I tuoi WOM'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.star_outline),
              text: 'Guadagnati',
            ),
            Tab(
              icon: Icon(Icons.check_circle_outline),
              text: 'Riscattati',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Tab 1: Contenuto per i WOM guadagnati (Rewards)
          WomRewardsTab(),
          // Tab 2: Contenuto per i WOM riscattati (Transactions)
          WomTransactionsTab(),
        ],
      ),
    );
  }
}

final dateFormatter = DateFormat('dd-MM-yyyy HH:mm:ss');

// --- Tab 1: WOM Guadagnati (Rewards) ---
class WomRewardsTab extends HookConsumerWidget {
  const WomRewardsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalRewards =
        ref.watch(getTotalWomEarnedCountProvider).valueOrNull ?? 0;
    final totalWomRedeemed =
        ref.watch(getTotalWomRedeemedCountProvider).valueOrNull ?? 0;

    final womToRedeem = totalRewards - totalWomRedeemed;
    final rewardsAsyncValue = ref.watch(getWomRewardsProvider);
    final loading = useState(false);
    return rewardsAsyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Errore: $err')),
      data: (rewardsList) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Card di riepilogo
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'WOM da riscattare',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$womToRedeem WOM',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    ElevatedButton.icon(
                      onPressed: womToRedeem > 0
                          ? () async {
                              if (loading.value) {
                                return;
                              }

                              try {
                                loading.value = true;
                                await ref
                                    .read(getWomRepositoryProvider)
                                    .redeemWom(womToRedeem);
                              } catch (ex) {
                                final dialog = AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.scale,
                                  title:
                                      'Errore durante la conversione dei WOM',
                                  btnOkOnPress: () {},
                                );
                                dialog.show();
                              } finally {
                                loading.value = false;
                              }
                            }
                          : null,
                      icon: loading.value
                          ? const Center(child: CircularProgressIndicator())
                          : const Icon(Icons.download),
                      label: const Text('Riscatta'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Titolo cronologia
            Text(
              'Cronologia Guadagni',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            // Lista dei guadagni
            if (rewardsList.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Center(child: Text('Nessun WOM guadagnato ancora.')),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: rewardsList.length,
                itemBuilder: (context, index) {
                  final reward = rewardsList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      isThreeLine: true,
                      leading: const Icon(Icons.star, color: Colors.amber),
                      title: Text('${reward.womCount} WOM'),
                      subtitle: Text(
                        'Ottenuti il: ${dateFormatter.format(reward.addedOn)}\n'
                        'ExperimentId: ${reward.experimentId ?? '-'} | SessionId: ${reward.sessionId ?? '-'}',
                      ),
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

// --- Tab 2: WOM Riscattati (Transactions) ---
class WomTransactionsTab extends ConsumerWidget {
  const WomTransactionsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalTransactions =
        ref.watch(getTotalWomRedeemedCountProvider).valueOrNull ?? 0;
    final transactionsAsyncValue = ref.watch(getWomTransactionsProvider);

    return transactionsAsyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Errore: $err')),
      data: (transactionsList) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Card di riepilogo
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'WOM Riscattati',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$totalTransactions WOM',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Titolo cronologia
            Text(
              'Cronologia Riscatti',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            // Lista delle transazioni
            if (transactionsList.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Center(child: Text('Nessun WOM riscattato ancora.')),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactionsList.length,
                itemBuilder: (context, index) {
                  final transaction = transactionsList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      onTap: () {
                        context.go('/wom/details', extra: transaction);
                      },
                      leading:
                          const Icon(Icons.check_circle, color: Colors.green),
                      title: Text('${transaction.womCount} WOM'),
                      subtitle: Text('PIN: ${transaction.womPin}'),
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

class WomTransactionList extends ConsumerWidget {
  const WomTransactionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(getWomTransactionsProvider).valueOrNull ?? [];
    return ListView(
      children: [
        for (final l in list)
          ListTile(
            title: Text(l.addedOn.toString()),
            subtitle: Text(l.womPin),
            trailing: Text(l.womCount.toString()),
          ),
      ],
    );
  }
}
