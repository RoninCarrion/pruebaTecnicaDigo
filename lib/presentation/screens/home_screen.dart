import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/config/app_router.dart';
import 'package:pruebatecnica/presentation/common/custom_snackbar.dart';
import 'package:pruebatecnica/presentation/providers/country_provider.dart';
import 'package:pruebatecnica/presentation/providers/is_loading_provider.dart';
import 'package:pruebatecnica/presentation/providers/local_database_provider.dart';
import 'package:pruebatecnica/presentation/screens/search_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryProv = ref.watch(countryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar países'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRouter.searchScreen);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () async {
                ref.read(isLoadingProvider.notifier).state = true;
                await Future.delayed(Duration(seconds: 1));
                await ref
                    .read(localDatabaseProvider.notifier)
                    .getFavouritesCountry();
                ref.read(isLoadingProvider.notifier).state = false;
                Get.toNamed(AppRouter.favouritesScreen);
              },
              icon: Icon(
                Icons.favorite_rounded,
                color: Colors.red,
              ))
        ],
      ),
      body: (ref.watch(isLoadingProvider))
          ? LoadingView()
          : countryProv.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Get.toNamed(AppRouter.datailsScreen,
                          arguments: data[index]),
                      title: Text(data[index].name.common),
                      subtitle: Text(data[index].capital.first),
                      trailing: IconButton(
                          onPressed: () {
                            ref
                                .read(localDatabaseProvider.notifier)
                                .writeFavouritesCountry(country: data[index]);
                            CustomSnackbar().showSnackBar(
                                title: 'País favorito agregado',
                                message:
                                    'El país ${data[index].name.common} se ha agregado correctamente a tu lista de favoritos');
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )),
                    );
                  },
                );
              },
              error: (error, stackTrace) => ErrorWidget(
                error: error.toString(),
              ),
              loading: () => LoadingView(),
            ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String error;
  const ErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.amber,
        ),
        Text(
          'Algo ha ido mal :(', // style: TextStyle(fontSize: 2)
        ),
        Text(error)
      ],
    );
  }
}
