import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';
import 'package:pruebatecnica/domain/repositories/country_repository.dart';
import 'package:pruebatecnica/presentation/providers/country_provider.dart';
import 'package:pruebatecnica/presentation/providers/country_repository_provider.dart';

enum SearchTypes { country, continent }

final StateProvider<String> queryProvider = StateProvider<String>(
  (ref) => '',
);

final countryByNameProvider =
    StateNotifierProvider<CountryNotifier, List<CountryModel>>(
  (ref) => CountryNotifier(ref, ref.read(countryRepositoryProvider)),
);

class CountryNotifier extends StateNotifier<List<CountryModel>> {
  final Ref ref;
  final CountryRepository repository;
  CountryNotifier(this.ref, this.repository) : super([]);

  Future<void> searchCountriesByName({required String query}) async {
    if (query.isEmpty) return;
    try {
      state = await repository.getCountryByName(query: query);
    } catch (e) {
      throw Exception('Algo ha ido mal ${e.toString()}');
    }
  }
  Future<void> searchCountriesByContinent({required String query}) async {
    if (query.isEmpty) return;
    try {
      state = await repository.getCountriesByContinent(query: query);
    } catch (e) {
      throw Exception('Algo ha ido mal ${e.toString()}');
    }
  }
}
