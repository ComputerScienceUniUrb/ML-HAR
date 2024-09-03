import 'package:aifit/features/settings/screens/user_details/custom_number_form_field.dart';
import 'package:aifit/features/settings/screens/user_height/application/height_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeightScreen extends ConsumerStatefulWidget {
  const HeightScreen({super.key});

  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends ConsumerState<HeightScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = ref.watch(heightNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Center(
                child: Image.asset('assets/images/height.png'),
              ),
            ),
            Text(
              'La tua altezza',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 15),
            Text(
              'Abbiamo bisogno della tua altezza',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Form(
                key: _formKey,
                child: CustomNumberFormField(
                  labelText: 'Altezza',
                  suffix: 'cm',
                  initialValue: height.toString(),
                  onChanged: (value) => ref
                      .read(heightNotifierProvider.notifier)
                      .setHeight(int.tryParse(value)),
                  validator: (value) {
                    try {
                      final height = double.parse(value ?? '');
                      if (height < 50) {
                        return 'Sei troppo basso!';
                      } else if (height > 240) {
                        return 'Sei troppo alto!';
                      } else {
                        return null;
                      }
                    } on FormatException catch (_) {
                      return 'Format exception';
                    }
                  },
                  onSaved: (newValue) {
                    try {
                      // PreferenceManager.updateUserInfo(
                      //   height: int.parse(newValue ?? ''),
                      // );
                    } on FormatException catch (e) {
                      debugPrint(
                        'Some error occurred saving height data: ${e.message}',
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
