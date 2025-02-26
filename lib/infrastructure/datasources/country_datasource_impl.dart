import 'package:dio/dio.dart';
import 'package:pruebatecnica/domain/datasources/country_datasource.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';

class CountryDatasourceImpl extends CountryDatasource {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://restcountries.com/v3.1',
      sendTimeout: Duration(seconds: 10)));
  @override
  Future<List<CountryModel>> getCountries() async {
    List<CountryModel> listToReturn = [];
    final temporalList = [];
    try {
      final res = await dio.get('/all');
      if (res.statusCode == 200) {
        for (var i = 0; i < 30; i++) {
          temporalList.add(res.data[i]);
        }
        listToReturn = temporalList.map((data) {
          print(data);
          return CountryModel.fromJson(data);
        }).toList();
      return listToReturn;
      }
      return listToReturn;

    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CountryModel>> getCountriesByRegion(
      {required String query}) async {
    List<CountryModel> listToReturn = [];
    try {
      final response =
          await dio.get('/region/$query');
      if (response.statusCode == 200) {
        print(response.data[0].runtimeType);
        listToReturn = response.data.map((Map<String, dynamic> data) {
          print(data);
          return CountryModel.fromJson(data);
        }).toList();
      }

      return listToReturn;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CountryModel>> getCountryByName({required String query}) async{
    List<CountryModel> listToReturn = [];
    try {
      final response =
          await dio.get('/name/$query');
      if (response.statusCode == 200) {
        print(response.data[0].runtimeType);
        listToReturn = response.data.map((Map<String, dynamic> data) {
          print(data);
          return CountryModel.fromJson(data);
        }).toList();
      }

      return listToReturn;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
