import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/config/app_router.dart';
import 'package:pruebatecnica/presentation/common/custom_snackbar.dart';
import 'package:pruebatecnica/presentation/providers/country_provider.dart';
import 'package:pruebatecnica/presentation/providers/is_loading_provider.dart';
import 'package:pruebatecnica/presentation/providers/local_database_provider.dart';

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

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: List.filled(12, customListTileItem(size)),
    );
  }

  Widget customListTileItem(Size size) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
      ),
      title: Container(
        height: size.height * 0.04,
        width: size.width * 0.7,
        decoration: BoxDecoration(color: Colors.grey.shade300),
      ),
      subtitle: Container(
          height: size.height * 0.02,
          width: size.width * 0.7,
          decoration: BoxDecoration(color: Colors.grey.shade300)),
    );
  }
}
