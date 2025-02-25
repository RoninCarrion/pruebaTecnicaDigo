import 'package:pruebatecnica/domain/models/country_model.dart';

abstract class LocalDatabaseDatasource {
  Future<List<CountryModel>> getFavouritesCountry();
}
