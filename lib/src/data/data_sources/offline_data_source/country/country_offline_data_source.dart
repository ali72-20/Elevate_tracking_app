


import 'package:tracking_app/src/data/models/country_model.dart';

abstract interface class CountryOfflineDataSource{
  Future<List<CountryModel>> getAllCountries();
}