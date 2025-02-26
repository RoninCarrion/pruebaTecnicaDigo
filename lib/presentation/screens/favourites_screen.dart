import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/presentation/providers/local_database_provider.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritesCountries = ref.watch(localDatabaseProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Países favoritos'),
      ),
      body: ListView.builder(
        itemCount: favouritesCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            subtitle: Text('Capital: ${favouritesCountries[index].capital}'),
            title: Text(favouritesCountries[index].name.common),
          );
        },
      ),
    );
  }
}
