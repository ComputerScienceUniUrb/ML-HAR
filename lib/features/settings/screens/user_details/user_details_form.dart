import 'package:aifit/core/data/user/models/gender.dart';
import 'package:aifit/features/settings/screens/user_details/application/user_details_notifier.dart';
import 'package:aifit/features/settings/screens/user_details/widgets/custom_number_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class UserDetailsFormScreen extends ConsumerStatefulWidget {
  const UserDetailsFormScreen({super.key});

  @override
  UserDetailsFormScreenState createState() => UserDetailsFormScreenState();
}

class UserDetailsFormScreenState extends ConsumerState<UserDetailsFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDetailsNotifierProvider);
    final weight = userData.weight;
    final height = userData.height;
    final age = userData.age;
    final gender = userData.gender;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 32),
          // Padding(
          //     padding: const EdgeInsets.all(48.0),
          //     child: Image.asset(
          //       'assets/images/eta.png',
          //     )),
          Text(
            'User details',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white,
                ),
          ),
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
                            return 'invalid_age_txt';
                          } else if (age > 130) {
                            return 'too_old_error_txt';
                          }
                        } on FormatException catch (_) {
                          return 'Format exception';
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
                          .setHeight(int.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null) {
                        try {
                          int age = int.parse(value);
                          if (age <= 0) {
                            return 'invalid_age_txt';
                          } else if (age > 130) {
                            return 'too_old_error_txt';
                          }
                        } on FormatException catch (_) {
                          return 'invalid_age_txt';
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
                            return 'too_heavy_error_txt';
                          }
                        } on FormatException catch (_) {
                          return 'invalid_weight_txt';
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
                      onChanged: (value) {
                        ref
                            .read(userDetailsNotifierProvider.notifier)
                            .setGender(value);
                      },
                      hintText: 'Genere',
                    ),
                  ),
                  /*CustomDropdownFormField<Gender>(
                    value: gender,
                    hint: 'Genere',
                    valueIndex:
                        gender == null ? null : Gender.values.indexOf(gender),
                    onChanged: (value) {
                      ref
                          .read(userDetailsNotifierProvider.notifier)
                          .setGender(value);
                    },
                    items: Gender.values
                        .map(
                          (e) => CustomDropdownItem<Gender>(
                            text: e.name,
                          ),
                        )
                        .toList(),
                    openColor: const Color(0xFFF4F6F9),
                    enabledColor: Colors.white,
                    enableTextColor: const Color(0xFFBFBFBF),
                    elementTextColor: const Color(0xFF666666),
                    enabledIconColor: Theme.of(context).primaryColor,
                    validator: (_) => null,
                    onSaved: (newValue) {},
                  ),*/
                  const SizedBox(height: 75),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
