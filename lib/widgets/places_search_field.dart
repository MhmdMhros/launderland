import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:launder_land/widgets/custom_text_field.dart';
import 'package:uuid/uuid.dart';

class PlacesSearchField extends StatefulWidget {
  const PlacesSearchField({super.key, required this.onTap});
  final void Function(dynamic) onTap;

  @override
  State<PlacesSearchField> createState() => _PlacesSearchFieldState();
}

class _PlacesSearchFieldState extends State<PlacesSearchField> {
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  var uuid = const Uuid();
  String sessionToken = '1234567890';
  List<dynamic> _placeList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    const String placesApiKey = "AIzaSyBNCt7Eo9XcH2n2Yn5ApB_lvJ099AapGcQ";
    final Dio dio = Dio();

    try {
      String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$placesApiKey&sessiontoken=$sessionToken';
      var response = await dio.get(request);
      var data = response.data;
      if (kDebugMode) {
        print('mydata');
        print(data);
      }
      if (response.statusCode == 200) {
        setState(() {
          _placeList = response.data['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: CustomTextField(
            focusNode: _focusNode,
            isFinal: true,
            controller: _controller,
            label: "Search your location here",
            validator: (String? value) => null,
            isMapSearch: true,
          ),
        ),
        _placeList.isEmpty
            ? SizedBox.shrink()
            : SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _placeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        widget.onTap(_placeList[index]);
                        setState(() {
                          _focusNode.unfocus();
                          _placeList = [];
                          _controller.clear();
                        });
                      },
                      child: ListTile(
                        title: Text(_placeList[index]["description"]),
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }
}
