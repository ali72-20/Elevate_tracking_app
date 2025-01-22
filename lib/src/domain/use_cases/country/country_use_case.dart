import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/domain/entities/country/country_entity.dart';
import 'package:tracking_app/src/domain/repositories/country/country_repo.dart';

@injectable
class CountryUseCase {
  final CountryRepo _countryRepo;

  CountryUseCase(this._countryRepo);

  Future<List<CountryEntity>> getCountries() async {
    return await _countryRepo.getCountries();
  }
}
