import 'package:get_storage/get_storage.dart';
import 'package:pruebatecnica/domain/datasources/local_database_datasource.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';

class LocalDatabaseDatasourceImpl extends LocalDatabaseDatasource {
  final storage = GetStorage();
  @override
  Future<List<CountryModel>> getFavouritesCountry() async {

    return await storage.read('favourites');
    
  }
}
