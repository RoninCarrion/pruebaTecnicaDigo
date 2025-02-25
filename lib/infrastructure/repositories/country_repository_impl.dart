import 'package:pruebatecnica/domain/datasources/country_datasource.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';
import 'package:pruebatecnica/domain/repositories/country_repository.dart';

class CountryRepositoryImpl extends CountryRepository {
  final CountryDatasource _datasource;

  CountryRepositoryImpl({required CountryDatasource datasource})
      : _datasource = datasource;
  @override
  Future<List<CountryModel>> getCountries() async {
    return await _datasource.getCountries();
  }

  @override
  Future<List<CountryModel>> getCountriesByRegion(
      {required String query}) async {
    return await _datasource.getCountriesByRegion(query: query);
  }

  @override
  Future<List<CountryModel>> getCountryByName({required String query}) async {
    return await _datasource.getCountryByName(query: query);
  }
}
