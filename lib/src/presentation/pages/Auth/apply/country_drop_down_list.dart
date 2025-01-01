import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utilities/style/spacing.dart';
import 'package:tracking_app/src/domain/entities/country/country_entity.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';

import '../../../../../core/common/common_imports.dart';

class CountryDropDownList extends StatefulWidget {
  const CountryDropDownList({super.key});

  @override
  State<CountryDropDownList> createState() => _CountryDropDownListState();
}

class _CountryDropDownListState extends State<CountryDropDownList> {
  List<CountryEntity> countries = [];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplyScreenViewModel>();
    countries = viewModel.countries;
    return DropdownButtonFormField<CountryEntity>(
      value: viewModel.selectedCountry,
      isExpanded: true,
      items: countries
          .map((e) =>
          DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                Image.asset(e.flag!),
                horizontalSpace(8),
                Text(e.name!),
              ],
            ),
          ),)
          .toList(),
      onChanged: (value) {
        setState(() {
          viewModel.selectedCountry = value!;
        });
      },
    );
  }
}
