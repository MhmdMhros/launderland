import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'phone_number_provider.g.dart';

@riverpod
class Phone extends _$Phone {
  @override
  String build() {
    return '';
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

    state = phone;
  }
}
