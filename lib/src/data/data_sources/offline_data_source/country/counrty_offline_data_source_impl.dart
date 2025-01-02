import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/jsons/json_paths.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/country/country_offline_data_source.dart';
import 'package:tracking_app/src/data/models/country_model.dart';

@Injectable(as: CountryOfflineDataSource)
class CountryOfflineDataSourceImpl implements CountryOfflineDataSource{
  @override
  Future<List<CountryModel>> getAllCountries() async{
    return await Future.delayed(const Duration(seconds: 1), () async{
      final countries = await rootBundle.loadString(JsonPaths.country);
      log("countries: $countries");
      final countriesJson = json.decode(countries) as List;
      return countriesJson.map((e) => CountryModel.fromJson(e)).toList();
    });
  }
}
