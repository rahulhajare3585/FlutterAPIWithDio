import 'package:flutter/material.dart';
import 'package:flutter_api_intrgration/model/offline/model/offline_provider.dart';
import 'package:flutter_api_intrgration/screens/routing/app_routes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  // Register Hive adapters
  Hive.registerAdapter(OfflineProviderAdapter()); // This line should now work
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/', // Set the initial route
        routes: AppRoutes.getRoutes(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ));
  }
}
