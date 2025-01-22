import 'package:tracking_app/src/domain/entities/country/country_entity.dart';

abstract interface class CountryRepo{
  Future<List<CountryEntity>> getCountries();
}