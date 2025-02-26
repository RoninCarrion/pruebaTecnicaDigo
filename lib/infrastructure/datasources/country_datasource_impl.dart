import 'package:dio/dio.dart';
import 'package:pruebatecnica/domain/datasources/country_datasource.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';

class CountryDatasourceImpl extends CountryDatasource {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://restcountries.com/v3.1',
      sendTimeout: Duration(seconds: 10)));
  @override
  Future<List<CountryModel>> getCountries() async {
    try {
      final res = await dio.get('/all');
      if (res.statusCode == 200) {
        final List<dynamic> data = res.data;
        return data
            .take(30)
            .map((data) => CountryModel.fromJson(data))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CountryModel>> getCountriesByRegion(
      {required String query}) async {
    try {
      final res = await dio.get('/region/$query');

      if (res.statusCode == 200 && res.data is List) {
        final List<dynamic> data = res.data;
        return data.take(30).map((e) => CountryModel.fromJson(e)).toList();
      }

      return [];
    } on DioException catch (e) {
      throw Exception('Error en la API: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: ${e.toString()}');
    }
  }

  @override
  Future<List<CountryModel>> getCountryByName({required String query}) async {
    try {
      final res = await dio.get('/name/$query');

      if (res.statusCode == 200 && res.data is List) {
        final List<dynamic> data = res.data;
        return data.map((e) => CountryModel.fromJson(e)).toList();
      }

      return [];
    } on DioException catch (e) {
      throw Exception('Error en la API: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: ${e.toString()}');
    }
  }
}
