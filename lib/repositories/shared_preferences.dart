import 'dart:convert';

import 'package:flutter_mds_angers_2024_b3/models/company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  Future<void> saveCompanies(List<Company> companies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> listJson = [];
    for (final Company company in companies) {
      // Sérialisation de l'objet company en Map<String, dynamic>
      final Map<String, dynamic> mapJson = company.toJson();

      // Transformation de la Map en String
      final String json = jsonEncode(mapJson);

      // Stockage du json dans une liste
      listJson.add(json);
    }
    // Sauvegarde de la liste
    prefs.setStringList('companies', listJson);
  }

  Future<List<Company>> loadCompanies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<Company> companies = [];

    final List<String> companiesJson = prefs.getStringList('companies') ?? [];
    for (final String jsonCompany in companiesJson) {
      // Transformation string en map
      final Map<String, dynamic> mapCompany = jsonDecode(jsonCompany);

      // Transformation Map en instance de Company
      final Company company = Company.fromJson(mapCompany);
      companies.add(company);
    }

    return companies;
  }
}
