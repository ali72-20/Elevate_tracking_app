
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/country/country_offline_data_source.dart';
import 'package:tracking_app/src/domain/entities/country/country_entity.dart';
import 'package:tracking_app/src/domain/repositories/country/country_repo.dart';

@Injectable(as: CountryRepo)
class CountryRepoImpl implements CountryRepo {
  final CountryOfflineDataSource _countryOfflineDataSource;
  CountryRepoImpl(this._countryOfflineDataSource);
  @override
  Future<List<CountryEntity>> getCountries() async{
    var countries = await _countryOfflineDataSource.getAllCountries();
    return countries.map((e) => e.toDomain()).toList();
  }
}
