import 'package:flutter/material.dart';
import 'package:flutter_mds_angers_2024_b3/models/address.dart';
import 'package:flutter_mds_angers_2024_b3/models/company.dart';
import 'package:flutter_mds_angers_2024_b3/router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _companies = <Company>[
    const Company('Entreprise 1', Address('street', 'city', 'postcode')),
    const Company('Entreprise 2', Address('street', 'city', 'postcode')),
    const Company('Entreprise 3', Address('street', 'city', 'postcode')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des entreprises'),
      ),
      body: ListView.separated(
        itemCount: _companies.length,
        itemBuilder: (context, index) {
          final company = _companies[index];
          return ListTile(
            title: Text(company.name),
            subtitle: Text(company.address.toString()),
            leading: const Icon(Icons.account_box_outlined),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final company = await Navigator.of(context).pushNamed(AppRouter.addCompanyPage) as Company?;

          if (company != null) {
            setState(() {
              _companies.add(company);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
