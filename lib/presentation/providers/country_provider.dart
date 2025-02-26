import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/presentation/providers/country_repository_provider.dart';

final countryProvider = FutureProvider(
  (ref) async {
    final repository = ref.read(countryRepositoryProvider);
    return await repository.getCountries();
  },
);



