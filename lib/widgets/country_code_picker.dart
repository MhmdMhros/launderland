import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:dash_flags/dash_flags.dart' as flag;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launder_land/Providers/phone_number_provider/phone_number_provider.dart';

class CountryCodePicker extends ConsumerStatefulWidget {
  const CountryCodePicker({
    super.key,
  });

  @override
  ConsumerState<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends ConsumerState<CountryCodePicker> {
  late Country selectedCountry = Country.parse(ref.read(phoneProvider.notifier).getCountryCode());

  @override
  Widget build(BuildContext context) {
    void onSelectCountry(Country country) {
      setState(() {
        selectedCountry = country;
        ref.read(phoneProvider.notifier).setCountryCode(country.countryCode);
      });
    }

    void showPicker() async {
      showCountryPicker(
        customFlagBuilder: (country) {
          List<String> countriesDiff = ['as', 'in', 'do', 'is'];
          var countryCode = country.countryCode.toLowerCase();
          if (countriesDiff.contains(countryCode)) {
            countryCode = 'c_$countryCode';
          }
          if (countryCode == 'ac') {
            countryCode = 'sh_$countryCode';
          }
          return flag.CountryFlag(
            country: flag.Country.fromCode(countryCode),
            height: 25,
          );
        },
        context: context,
        showPhoneCode: true,
        countryListTheme: CountryListThemeData(
          inputDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFFF0000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFFF0000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorMaxLines: 1,
            errorStyle: TextStyle(
              color: const Color(0xFFFF0000),
              fontSize: 12,
              fontFamily: 'Inter',
              height: 0.1,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFFE6E6E6),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFFE6E6E6),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            label: Text(
              'Search',
              style: TextStyle(
                color: const Color(0xFFCCCCCC),
                fontSize: 16,
                fontFamily: 'Inter',
              ),
            ),
          ),
          backgroundColor: Colors.white,
          bottomSheetHeight: 500,
          searchTextStyle: TextStyle(
            color: const Color(0xFF262626),
            fontSize: 16,
            fontFamily: 'Inter',
          ),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        onSelect: onSelectCountry,
      );
    }

    return GestureDetector(
      onTap: showPicker,
      child: Container(
        width: 77,
        height: 44,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: UnderlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFE6E6E6),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            flag.CountryFlag(
              country: flag.Country.fromCode(selectedCountry.countryCode), // You can also use Country.fromCode('eg')
              // height: 50,
              height: 19,
            ),
            Text(
              ' +${selectedCountry.phoneCode}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: const Color(0xFF262626),
              ),
            ),
            // SizedBox(width: 8),
            // Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }
}
