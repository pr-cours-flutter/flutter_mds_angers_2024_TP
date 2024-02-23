import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mds_angers_2024_b3/models/company.dart';
import 'package:flutter_mds_angers_2024_b3/repositories/shared_preferences.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {
  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit(this.preferencesRepository) : super([]);

  final PreferencesRepository preferencesRepository;

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    final companies = await preferencesRepository.loadCompanies();
    emit(companies);
  }

  /// Méthode pour ajouter une entreprise
  Future<void> addCompany(Company company) async {
    emit([...state, company]);
    await preferencesRepository.saveCompanies(state);
  }
}
