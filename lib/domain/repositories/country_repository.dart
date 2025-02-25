import 'package:pruebatecnica/domain/models/country_model.dart';

abstract class CountryRepository {
  Future<List<CountryModel>> getCountries();
  Future<List<CountryModel>> getCountryByName({required String query});
  Future<List<CountryModel>> getCountriesByRegion({required String query});
}
