import 'package:pruebatecnica/domain/models/country_model.dart';

abstract class LocalDatabaseDatasource {
  Future<List<CountryModel>> getFavouritesCountry();
  Future<void> writeFavouritesCountry({required Map<String, dynamic> data});
}
