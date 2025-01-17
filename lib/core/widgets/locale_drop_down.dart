import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localization/app_localization_cubit.dart';
import '../localization/app_localization_state.dart';

class LocaleDropDown extends StatelessWidget {
  final List<String> localLocaleDropdowns = ["en", "ar"];

  LocaleDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLocalizationCubit, AppLocalizationState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state is LoadedLocale ? state.locale : 'en',
          items: localLocaleDropdowns.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value) {
            context.read<AppLocalizationCubit>().changeLocale(value!);
          },
        );
      },
    );
  }
}
