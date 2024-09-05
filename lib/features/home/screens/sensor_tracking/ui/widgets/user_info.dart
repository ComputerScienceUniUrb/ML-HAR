import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/navigation/route_extensions.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/user_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfo extends ConsumerWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoProvider);
    return Card(
      child: InkWell(
          onTap: ()async {
            await context.pushRoute('/sensors-tracking/user-details');
            ref.invalidate(getUserInfoProvider);
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: switch (userInfo) {
            AsyncLoading() => const CircularProgressIndicator(),
            AsyncData(:final value) =>
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InfoText(
                              label: 'Altezza',
                              value: value.height?.toString() ?? '-',
                            ),
                            InfoText(
                              label: 'Peso',
                              value: value.weight?.toString() ?? '-',
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InfoText(
                              label: 'Età',
                              value: value.age?.toString() ?? '-',
                            ),
                            InfoText(
                              label: 'Genere',
                              value: value.gender?.name ?? '-',
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (value.isSomethingMissing)
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.warning,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Uno dei campi non è ancora configurato, '
                                  'aggiornali per procedere al test!',
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
            _ => const SizedBox.shrink(),
          },),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String label;
  final String value;

  const InfoText({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme
              .of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.grey),
        ),
        Text(
          value,
          style: Theme
              .of(context)
              .textTheme
              .labelLarge
              ?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
