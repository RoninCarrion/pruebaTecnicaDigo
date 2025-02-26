import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';
import 'package:pruebatecnica/domain/repositories/local_database_repository.dart';
import 'package:pruebatecnica/infrastructure/datasources/local_database_datasource_impl.dart';
import 'package:pruebatecnica/infrastructure/repositories/local_database_repository_impl.dart';

final localDatabaseProvider =
    StateNotifierProvider<LocalDatabaseNotifier, List<CountryModel>>(
  (ref) {
    final repository =
        LocalDatabaseRepositoryImpl(datasource: LocalDatabaseDatasourceImpl());
    return LocalDatabaseNotifier(repository);
  },
);

class LocalDatabaseNotifier extends StateNotifier<List<CountryModel>> {
  final LocalDatabaseRepository repository;
  LocalDatabaseNotifier(this.repository) : super([]);

  Future<void> getFavouritesCountry() async {
    try {
      state = await repository.getFavouritesCountry();
    } catch (e) {
      Exception('Ha ocurrido un error en cargar los países favoritos $e');
    }
  }

  Future<void> writeFavouritesCountry({required CountryModel country}) async {
    try {
      await repository.writeFavouritesCountry(data: country.toJson());
    } catch (e) {
      Exception(
          'Ha ocurrido un error al guardar tu país favorito los países favoritos $e');
    }
  }
}
