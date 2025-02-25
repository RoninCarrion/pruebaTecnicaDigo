import 'package:pruebatecnica/domain/models/country_model.dart';

abstract class CountryRepository {
  Future<List<CountryModel>> getFavouritesCountry();
}
