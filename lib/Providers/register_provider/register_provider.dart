import 'dart:math';
import 'package:launder_land/models/register_model/register_model.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  @override
  RegisterModel build() {
    return RegisterModel(
      password: generateRandomNumber(),
      role: 'customer',
    );
  }

  String _selectedCountryCode = 'EG';
  void setCountryCode(String countryCode) {
    _selectedCountryCode = countryCode;
  }

  String getCountryCode() {
    return _selectedCountryCode;
  }

  void setPhone(String phone) {
    String isoCode = getCountryCode();
    final phoneNumber =
        PhoneNumber.parse(phone, callerCountry: IsoCode.fromJson(isoCode));
    state.mobile_number = phone;
  }

  void setName(String name) {
    state.name = name;
  }

  void setEmail(String email) {
    state.email = email;
  }

  String generateRandomNumber() {
    var random = Random();
    int randomNumber = 100000 +
        random.nextInt(900000); // Random number between 100000 and 999999
    return randomNumber.toString();
  }
}
