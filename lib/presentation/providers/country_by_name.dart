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



  Future<void> searchCountries({required String query, required String type}) async {
    try {
      state = await repository.getCountries();
    } catch (e) {
      throw Exception('Ha ocurrido un error inesperado. ${e.toString()}');
    }
  }
  Future<void> searchCountriesByName({required String query}) async {
  }
  Future<void> filterCountriesByContinent({required String query}) async {
    
  }
}
