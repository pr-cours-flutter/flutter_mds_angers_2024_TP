import 'package:flutter_mds_angers_2024_b3/ui/screens/add_company.dart';
import 'package:flutter_mds_angers_2024_b3/ui/screens/home.dart';
import 'package:flutter_mds_angers_2024_b3/ui/screens/search_address.dart';

class AppRouter {
  static const String homePage = '/home';
  static const String addCompanyPage = '/add_company';
  static const String searchAddress = '/search_address';

  static final routes = {
    homePage: (context) => const Home(),
    addCompanyPage: (context) => const AddCompany(),
    searchAddress: (context) => const SearchAddress(),
  };
}
