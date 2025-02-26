import 'package:pruebatecnica/domain/datasources/local_database_datasource.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';
import 'package:pruebatecnica/domain/repositories/local_database_repository.dart';

class LocalDatabaseRepositoryImpl extends LocalDatabaseRepository {
  final LocalDatabaseDatasource datasource;

  LocalDatabaseRepositoryImpl({required this.datasource});

  @override
  Future<List<CountryModel>> getFavouritesCountry() async {
    return await datasource.getFavouritesCountry();
  }

  @override
  Future<void> writeFavouritesCountry(
      {required Map<String, dynamic> data}) async {
    return await datasource.writeFavouritesCountry(data: data);
  }
}
