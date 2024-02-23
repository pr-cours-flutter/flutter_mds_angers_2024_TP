import 'package:flutter_mds_angers_2024_b3/models/address.dart';

class Company {
  final String name;
  final Address address;

  const Company(this.name, this.address);

  // Stockage SharedPreferences
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonAddress = address.toJson();
    return {'name': name, 'address': jsonAddress};
  }

  // Stockage SharedPreferences
  factory Company.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final Map<String, dynamic> addressJson = json['address'];
    final address = Address.fromJson(addressJson);
    return Company(name, address);
  }
}

// {
//   'name': 'xxx',
//   'address': {
//     'street': 'xxx',
//     'city': 'xxx';
//     'psotcode': 'xxx'
//   }
// }
