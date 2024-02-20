import 'package:flutter/material.dart';
import 'package:flutter_mds_angers_2024_b3/models/company.dart';

class AddCompany extends StatelessWidget {
  AddCompany({super.key});

  final nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle entreprise'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le nom doit être renseigné';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.business),
                  labelText: 'Nom de l\'entreprise',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      final name = nameController.text;
                      final company = Company(name);
                      Navigator.of(context).pop(company);
                    }
                  },
                  child: const Text('Valider')),
            ],
          ),
        ),
      ),
    );
  }
}
