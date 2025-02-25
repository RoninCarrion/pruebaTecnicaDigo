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
    try {
      final response  = await dio.get('/all');
      if (response.statusCode == 200) {
        print(response.data[0].runtimeType);
        listToReturn = response.data.map((Map<String, dynamic> data) {
          print(data);
          return CountryModel.fromJson(data);
        }).toList();
      }

      return listToReturn;
    } on DioException catch (e){
      throw Exception(e.message);
    } 
    
    catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CountryModel>> getCountriesByRegion({required String query}) {
    // TODO: implement getCountriesByRegion
    throw UnimplementedError();
  }

  @override
  Future<List<CountryModel>> getCountryByName({required String query}) {
    // TODO: implement getCountryByName
    throw UnimplementedError();
  }
}
