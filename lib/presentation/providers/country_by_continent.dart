import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';
import 'package:pruebatecnica/infrastructure/datasources/country_datasource_impl.dart';
import 'package:pruebatecnica/infrastructure/repositories/country_repository_impl.dart';

final queryProvider = StateProvider(
  (ref) => '',
);

final countryByContinentProvider =
    StateNotifierProvider<CountryNotifier, List<CountryModel>>(
  (ref) => CountryNotifier(ref),
);

class CountryNotifier extends StateNotifier<List<CountryModel>> {
  CountryNotifier(Ref ref) : super([]);
}
