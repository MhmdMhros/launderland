import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:launder_land/models/geolocation_address_model.dart';
import 'package:launder_land/models/lat_lng_address_model.dart';

Future<String?> getAddressFromLatLng(context, double lat, double lng) async {
  final Dio dio = Dio();
  String host = 'https://maps.google.com/maps/api/geocode/json';
  final url = '$host?key=AIzaSyBNCt7Eo9XcH2n2Yn5ApB_lvJ099AapGcQ&language=en&latlng=$lat,$lng';
  var response = await dio.get(url);
  if (response.statusCode == 200) {
    GeolocationAddressModel addressData = GeolocationAddressModel.fromJson(response.data);
    log("response ==== $addressData");
    return addressData.results![0].formattedAddress;
  } else {
    log("response ==== $response");
    return null;
  }
}

Future<LatLng?> getLatLngFromAddress(context, String address) async {
  final Dio dio = Dio();
  String host = 'https://maps.google.com/maps/api/geocode/json';
  final url = '$host?key=AIzaSyBNCt7Eo9XcH2n2Yn5ApB_lvJ099AapGcQ&language=en&address=$address';
  var response = await dio.get(url);
  if (response.statusCode == 200) {
    LatLngAddressModel addressData = LatLngAddressModel.fromJson(response.data);
    log("response ==== ${addressData.toJson()}");
    log('${addressData.toJson()}');
    return LatLng(addressData.results![0].geometry!.location!.lat!, addressData.results![0].geometry!.location!.lng!);
  } else {
    log("response ==== $response");

    return null;
  }
}
