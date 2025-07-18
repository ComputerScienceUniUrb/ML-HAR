import 'package:aifit/core/data/user/models/gender.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/features/settings/screens/user_details/application/user_details_notifier.dart';
import 'package:aifit/features/settings/screens/user_details/widgets/custom_number_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:go_router/go_router.dart';

class UserDetailsFormScreen extends ConsumerStatefulWidget {
  final UserInfo initialUserInfo;

  const UserDetailsFormScreen({
    required this.initialUserInfo,
    super.key,
  });

  @override
  UserDetailsFormScreenState createState() => UserDetailsFormScreenState();
}

class UserDetailsFormScreenState extends ConsumerState<UserDetailsFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final weight = widget.initialUserInfo.weight;
    final height = widget.initialUserInfo.height;
    final age = widget.initialUserInfo.age;
    final gender = widget.initialUserInfo.gender;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomNumberFormField(
                    labelText: 'Età',
                    value: age?.toString() ?? '',
                    suffix: 'anni',
                    onChanged: (value) {
                      ref
                          .read(userDetailsNotifierProvider.notifier)
                          .setAge(int.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null) {
                        try {
                          int age = int.parse(value);
                          if (age <= 0) {
                            return 'L\'età deve essere maggiore di 0';
                          } else if (age > 130) {
                            return 'Troppo anziano';
                          }
                        } on FormatException catch (_) {
                          return 'Formato non valido';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomNumberFormField(
                    labelText: 'Altezza',
                    value: height?.toString() ?? '',
                    suffix: 'cm',
                    onChanged: (value) {
                      ref
                          .read(userDetailsNotifierProvider.notifier)
                          .setHeight(double.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null) {
                        try {
                          int height = int.parse(value);
                          if (height <= 50) {
                            return 'Troppo basso';
                          } else if (height > 240) {
                            return 'Troppo alto';
                          }
                        } on FormatException catch (_) {
                          return 'Formato non valido';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomNumberFormField(
                    labelText: 'Peso',
                    value: weight?.toString() ?? '',
                    suffix: 'kg',
                    onChanged: (value) {
                      ref
                          .read(userDetailsNotifierProvider.notifier)
                          .setWeight(double.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null) {
                        try {
                          int weight = int.parse(value);
                          if (weight < 25.0) {
                            return 'Troppo leggero';
                          } else if (weight > 580.0) {
                            return 'Peso eccessivo';
                          }
                        } on FormatException catch (_) {
                          return 'Formato non valido';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(9),
                    child: CustomDropdown<Gender>(
                      items: Gender.values,
                      initialItem: gender,
                      decoration: const CustomDropdownDecoration(
                        headerStyle: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      listItemBuilder: (context, item, enabled, _) {
                        return Text(item.translate);
                      },
                      headerBuilder: (context, item, enabled) {
                        return Text(item.translate);
                      },
                      onChanged: (value) {
                        ref
                            .read(userDetailsNotifierProvider.notifier)
                            .setGender(value);
                      },
                      hintText: 'Genere',
                    ),
                  ),
                  const SizedBox(height: 75),
                  ElevatedButton(
                    onPressed: () {
                      final result =
                          ref.read(userDetailsNotifierProvider.notifier).save();
                      if (result) {
                        context.go('/');
                      }
                    },
                    child: const Text('Salva i dati e procedi'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
