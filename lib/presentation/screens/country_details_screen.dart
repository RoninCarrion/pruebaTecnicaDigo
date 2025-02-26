import 'package:flutter/material.dart';
import 'package:pruebatecnica/domain/models/country_model.dart';

class CountryDetailsScreen extends StatelessWidget {
  final CountryModel countryModel;
  const CountryDetailsScreen({super.key, required this.countryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del país'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalles principales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                  Text('País: ${countryModel.name.common}'),
                  Text('Capital: ${countryModel.capital[0]}'),
                  Text('Continente: ${countryModel.continents[0]}'),
                                ],
                              ),
                )),
                SizedBox(height: 32,),
            Text(
              'Lenguas habladas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                                ...countryModel.languages.entries.map(
                  (e) => Text(e.value),
                                )
                              ]),
                ))
          ],
        ),
      ),
    );
  }
}
