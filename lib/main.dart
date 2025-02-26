import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pruebatecnica/config/app_router.dart';
import 'package:pruebatecnica/config/app_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba técnica de la aplicación',
      getPages: AppRouter().appRouter,
      initialRoute: AppRouter.home,
      theme: AppTheme().theme,
    );
  }
}
