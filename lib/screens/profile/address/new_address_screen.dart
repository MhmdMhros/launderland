import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:launder_land/models/add_address_model.dart';
import 'package:launder_land/utils/geolocator.dart';
import 'package:launder_land/utils/get_address.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/places_search_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng marker = LatLng(0, 0);
  String address = '';
  String title = '';

  BitmapDescriptor icon = BitmapDescriptor.defaultMarker;
  getIcon() async {
    await BitmapDescriptor.asset(ImageConfiguration(devicePixelRatio: 2.5),
            "assets/images/LocationPoint.jpg")
        .then(
      (value) {
        setState(() {
          icon = value;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getIcon();
    determinePosition().then(
      (value) {
        setState(() {
          marker = LatLng(value.latitude, value.longitude);
          _controller.future.then((controller) {
            controller.animateCamera(CameraUpdate.newLatLng(marker));
          });
        });
        if (mounted) {
          getAddressFromLatLng(context, value.latitude, value.longitude)
              .then((value) {
            setState(() {
              address = value!;
            });
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void addAddress() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (title.isNotEmpty) {
        if (context.mounted) {
          Operations()
              .addAddress(
                  context: context,
                  addressData: AddAddressModel(
                    id: -1,
                    formattedAddress: address,
                    latitude: marker.latitude.toString(),
                    longitude: marker.longitude.toString(),
                    title: title,
                    userId: prefs.getInt('userId'),
                  ).toJson())
              .then(
            (value) {
              if (value != null) {
                if (context.mounted) Navigator.pop(context, value);
              }
            },
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('address_type_needed'.tr()),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    }

    LatLng intialLocation = LatLng(23.762912, 90.427816);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('new_address'.tr()),
          ),
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 292, top: 80),
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  circles: {
                    Circle(
                      circleId: CircleId("1"),
                      radius: 420,
                      strokeWidth: 2,
                      strokeColor: const Color(0xFFF26122),
                      fillColor: Color(0x4CF26122),
                    ),
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId("1"),
                      position: intialLocation,
                      icon: icon,
                    )
                  },
                  onTap: (LatLng latLng) async {
                    getAddressFromLatLng(
                            context, latLng.latitude, latLng.longitude)
                        .then((value) {
                      log("Formatted Address: $value");
                      log('latLng: $latLng');
                      setState(() {
                        address = value!;
                        marker = latLng;
                      });
                    });

                    _controller.future.then((controller) {
                      controller.animateCamera(CameraUpdate.newLatLng(latLng));
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    target: marker,
                    zoom: 14.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    if (!_controller.isCompleted) {
                      _controller.complete(controller);
                    }
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 16, top: 16),
                    color: Theme.of(context).colorScheme.primary,
                    child: Center(
                      child: PlacesSearchField(
                        onTap: (place) {
                          getLatLngFromAddress(context, place["description"])
                              .then(
                            (value) {
                              if (value != null) {
                                setState(() {
                                  marker = value;
                                  _controller.future.then((controller) {
                                    controller.animateCamera(
                                        CameraUpdate.newLatLng(value));
                                  });
                                });
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 32, top: 10),
                    color: Theme.of(context).colorScheme.primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('address'.tr()),
                        SizedBox(height: 10),
                        Container(
                          height: 70,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFE6E6E6),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(address),
                        ),
                        SizedBox(height: 10),
                        Text('save_address_as'.tr()),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ActionChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () => setState(() => title = 'Home'),
                              label: Text('home'.tr()),
                              backgroundColor:
                                  title == 'Home' ? Color(0xFF222a59) : null,
                              labelStyle: TextStyle(
                                  color: title == 'Home' ? Colors.white : null),
                              avatar: Image.asset(
                                'assets/icons/ic_home.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            ActionChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () => setState(() => title = 'Office'),
                              label: Text('office'.tr()),
                              backgroundColor:
                                  title == 'Office' ? Color(0xFF222a59) : null,
                              labelStyle: TextStyle(
                                  color:
                                      title == 'Office' ? Colors.white : null),
                              avatar: Image.asset(
                                'assets/icons/ic_office.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            ActionChip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () => setState(() => title = 'Other'),
                              label: Text('other'.tr()),
                              backgroundColor:
                                  title == 'Other' ? Color(0xFF222a59) : null,
                              labelStyle: TextStyle(
                                  color:
                                      title == 'Other' ? Colors.white : null),
                              avatar: Image.asset(
                                'assets/icons/ic_other.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        FilledButton(
                          onPressed: addAddress,
                          style: FilledButton.styleFrom(
                            fixedSize: const Size(343, 50),
                            minimumSize: const Size(343, 50),
                            backgroundColor: const Color(0xFF222a59),
                          ),
                          child: Text(
                            'add'.tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
