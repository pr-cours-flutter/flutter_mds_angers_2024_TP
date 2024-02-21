import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mds_angers_2024_b3/blocs/company_cubit.dart';
import 'package:flutter_mds_angers_2024_b3/router.dart';

void main() {
  // Pour pouvoir utiliser les SharedPreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();

  final companyCubit = CompanyCubit();
  companyCubit.loadCompanies();

  runApp(BlocProvider(create: (_) => companyCubit, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: AppRouter.routes,
      initialRoute: AppRouter.homePage,
    );
  }
}
