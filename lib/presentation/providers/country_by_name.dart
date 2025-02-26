import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';
import 'package:pruebatecnica/domain/repositories/country_repository.dart';
import 'package:pruebatecnica/presentation/providers/country_repository_provider.dart';

final StateProvider<String> queryProvider = StateProvider<String>(
  (ref) => '',
);

final countryByNameProvider = FutureProvider(
  (ref) => CountryNotifier(ref, ref.read(countryRepositoryProvider)),
);

class CountryNotifier extends StateNotifier<List<CountryModel>> {
  final Ref ref;
  final CountryRepository repository;
  CountryNotifier(this.ref, this.repository) : super([]);

  Future<void> searchCountries(
      {required String query, required String type}) async {
    try {
      state = await repository.getCountries();
    } catch (e) {
      throw Exception('Ha ocurrido un error inesperado. ${e.toString()}');
    }
  }

  List<CountryModel> searchCountriesByName({required String query}) {
    List<CountryModel> filteredList = [];
    if (state.isEmpty) return filteredList;
    if (query.isEmpty) return filteredList;
    filteredList = state
        .where(
          (element) =>
              element.name.common.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return filteredList;
  }
  List<CountryModel> searchCountriesByContinent({required String query}) {
    List<CountryModel> filteredList = [];
    if (state.isEmpty) return filteredList;
    if (query.isEmpty) return filteredList;
    filteredList = state
        .where(
          (element) =>
              element.continents[0].name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return filteredList;
  }

}
