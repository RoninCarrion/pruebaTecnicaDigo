import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/infrastructure/datasources/country_datasource_impl.dart';
import 'package:pruebatecnica/infrastructure/repositories/country_repository_impl.dart';

final countryRepositoryProvider = Provider((ref) => CountryRepositoryImpl(datasource: CountryDatasourceImpl()),);