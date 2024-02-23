class Address {
  final String street;
  final String city;
  final String postcode;

  const Address(this.street, this.city, this.postcode);

  // API
  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final String street = properties['name'];
    final String city = properties['city'];
    final String postcode = properties['postcode'];

    return Address(street, postcode, city);
  }

  // Stockage SharedPreferences
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'postcode': postcode,
    };
  }

  // Stockage SharedPreferences
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json['street'], json['city'], json['postcode']);
  }

  @override
  String toString() => '$street, $postcode - $city';
}
