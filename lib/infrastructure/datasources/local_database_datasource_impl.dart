import 'package:get_storage/get_storage.dart';
import 'package:pruebatecnica/domain/datasources/local_database_datasource.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';

class LocalDatabaseDatasourceImpl extends LocalDatabaseDatasource {
  final storage = GetStorage();
  @override
  Future<List<CountryModel>> getFavouritesCountry() async {
    try {
      final list = await storage.read('favourites');

      print(list);

      return [CountryModel.fromJson(list)];
    } catch (e) {
      throw Exception('Algo ha ido mal ${e.toString()}');
    }
  }

  @override
  Future<void> writeFavouritesCountry(
      {required Map<String, dynamic> data}) async {
    await storage.write('favourites', data);
  }
}
