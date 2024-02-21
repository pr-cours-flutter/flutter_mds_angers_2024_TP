import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mds_angers_2024_b3/blocs/company_cubit.dart';
import 'package:flutter_mds_angers_2024_b3/models/company.dart';
import 'package:flutter_mds_angers_2024_b3/router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des entreprises'),
      ),
      body: BlocBuilder<CompanyCubit, List<Company>>(
        builder: (context, companies) {
          return ListView.separated(
            itemCount: companies.length,
            itemBuilder: (_, index) {
              final company = companies[index];
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(AppRouter.addCompanyPage),
        child: const Icon(Icons.add),
      ),
    );
  }
}
