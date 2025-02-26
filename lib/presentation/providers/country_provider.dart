import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';
import 'package:pruebatecnica/presentation/providers/country_repository_provider.dart';

final countryProvider = FutureProvider<List<CountryModel>>(
  (ref) async {
    final repository = ref.read(countryRepositoryProvider);
    return await repository.getCountries();
  },
);



