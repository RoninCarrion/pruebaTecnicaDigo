import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/presentation/providers/country_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryProv = ref.watch(countryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar países'),
      ),
      body: countryProv.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].name.common),
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
      children: List.filled(7, customListTileItem(size)),
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
