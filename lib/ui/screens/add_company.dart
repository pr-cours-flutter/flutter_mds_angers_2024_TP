import 'package:flutter/material.dart';
import 'package:flutter_mds_angers_2024_b3/models/address.dart';
import 'package:flutter_mds_angers_2024_b3/models/company.dart';
import 'package:flutter_mds_angers_2024_b3/router.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({super.key});

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final nameController = TextEditingController();
  Address? _address;
  final addressController = TextEditingController();

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
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: addressController,
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'L\'adresse doit être renseignée';
                  }
                  return null;
                },
                onTap: () async {
                  _address = await Navigator.of(context).pushNamed(AppRouter.searchAddress) as Address?;
                  if (_address != null) {
                    addressController.text = _address!.toString();
                  } else {
                    addressController.text = '';
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'Adresse de l\'entreprise',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if ((formKey.currentState?.validate() ?? false) && _address != null) {
                      final name = nameController.text;
                      final company = Company(name, _address!);
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
