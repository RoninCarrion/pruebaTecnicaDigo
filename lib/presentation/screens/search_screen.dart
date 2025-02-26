import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebatecnica/presentation/providers/country_by_parameters_provider.dart';
import 'package:pruebatecnica/presentation/providers/is_loading_provider.dart';

final searchTypeProvider =
    StateProvider<SearchTypes>((ref) => SearchTypes.country);

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCountryProvider = ref.read(countryByNameProvider.notifier);
    final searchProvider = ref.watch(searchTypeProvider);
    final countryProvider = ref.watch(countryByNameProvider);
    final txtCtrl = TextEditingController();
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: txtCtrl,
          onChanged: (value) {
            ref.read(queryProvider.notifier).state = value;
          },
          decoration: InputDecoration(
            hintText: "Buscar ${searchProvider.toString().split('.').last}",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          PopupMenuButton<SearchTypes>(
            icon: Icon(Icons.filter_list),
            onSelected: (value) {
              ref.read(searchTypeProvider.notifier).state = value;
            },
            itemBuilder: (context) {
              return [SearchTypes.country, SearchTypes.continent]
                  .map((option) => PopupMenuItem<SearchTypes>(
                        value: option,
                        child: Text(option
                            .toString()
                            .split('.')
                            .last), // Quitar "SearchTypes."
                      ))
                  .toList();
            },
          ),
          IconButton(
            onPressed: () async {
              if (ref.read(searchTypeProvider) == SearchTypes.country) {
                await onCountryProvider.searchCountriesByName(
                    query: ref.read(queryProvider));
                return;
              }
              if (ref.read(searchTypeProvider) == SearchTypes.continent) {
                await onCountryProvider.searchCountriesByContinent(
                    query: ref.read(queryProvider));
              }
            },
            icon: Icon(Icons.send_rounded),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CupertinoActivityIndicator())
          : countryProvider.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 50),
                      Text('Busca un elemento'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: countryProvider.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(countryProvider[index].name.common),
                    );
                  },
                ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String error;
  const ErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.amber, size: 50),
          SizedBox(height: 10),
          Text('Algo ha ido mal :(', style: TextStyle(fontSize: 18)),
          Text(error, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: List.generate(7, (index) => customListTileItem(size)),
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
        decoration: BoxDecoration(color: Colors.grey.shade300),
      ),
    );
  }
}
