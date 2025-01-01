import '../../../../../core/common/common_imports.dart';

class CountryDropDownList extends StatelessWidget {
  const CountryDropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:InputDecoration(
        hintText: "Country",
      ),
    );
  }
}
