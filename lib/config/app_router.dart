import 'package:get/route_manager.dart';
import 'package:pruebatecnica/presentation/screens/home_screen.dart';
import 'package:pruebatecnica/presentation/screens/search_screen.dart';

class AppRouter {
  static const home = '/';
  static const searchScreen = '/search-screen';
  final appRouter = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: searchScreen,
      page: () => const SearchScreen(),
    )
  ];
}
