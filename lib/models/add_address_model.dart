class AddAddressModel {
  int? id;
  int? userId;
  String? title;
  String? formattedAddress;
  String? latitude;
  String? longitude;

  AddAddressModel({this.id, this.userId, this.title, this.formattedAddress, this.latitude, this.longitude});

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    formattedAddress = json['formatted_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['formatted_address'] = formattedAddress;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
