class Geo {
  String? lat;
  String? lng;
  Geo({this.lat, this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'], lng: json['lng']);
  }
}
