import 'package:get/route_manager.dart';
import 'package:pruebatecnica/presentation/screens/home_screen.dart';

class AppRouter {
  static const home = '/';
  final appRouter = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
    )
  ];
}
