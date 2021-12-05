class Geo {
  final double lat;
  final double lng;

  Geo({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
    };
  }
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}

class User {
  final int id;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User({
    required this.id,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'address': address?.toJson(),
      'phone': phone,
      'website': website,
      'company': company?.toJson(),
    };
  }
}
