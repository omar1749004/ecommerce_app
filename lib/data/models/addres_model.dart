
class AddresModels{
  int addressid;
  String name;
  String city;
  String street;
  double lat;
  double long;


  AddresModels({
    required this.addressid,
    required this.name,
    required this.city,
    required this.street,
    required this.lat,
    required this.long,
  });
  factory AddresModels.fromjsone(Map<String, dynamic> json) {
     return AddresModels(
      addressid: json["address_id"],
       name: json["address_name"],
        city: json["address_city"],
        street: json["address_street"],
        lat: json["address_lat"],
        long: json["address_long"],
        );
  }

}