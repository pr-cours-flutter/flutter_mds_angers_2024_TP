import 'package:flutter/material.dart';
import 'package:flutter_mds_angers_2024_b3/models/address.dart';
import 'package:flutter_mds_angers_2024_b3/repositories/address_repository.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  final _addressRepository = AddressRepository();

  final List<Address> _addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche adresses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
                labelText: 'Adresse de l\'entreprise',
              ),
              onChanged: (value) async {
                if (value.length >= 3) {
                  final addresses = await _addressRepository.fetchAddresses(value);
                  setState(() {
                    _addresses.clear();
                    _addresses.addAll(addresses);
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          if (_addresses.isEmpty) const Text('Aucun résultat'),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  return ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(address.street),
                    subtitle: Text('${address.postcode}, ${address.city}'),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () => Navigator.of(context).pop(address),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 0,
                  );
                },
                itemCount: _addresses.length),
          ),
        ],
      ),
    );
  }
}
