import 'package:flutter_mds_angers_2024_b3/ui/screens/add_company.dart';
import 'package:flutter_mds_angers_2024_b3/ui/screens/home.dart';

class AppRouter {
  static const String homePage = '/home';
  static const String addCompanyPage = '/add_company';

  static final routes = {
    homePage: (context) => const Home(),
    addCompanyPage: (context) => AddCompany(),
  };
}
