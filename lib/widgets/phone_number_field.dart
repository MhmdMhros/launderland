import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:launder_land/widgets/country_code_picker.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    this.onSaved,
    this.focusNode,
    this.controller,
  });
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CountryCodePicker(),
            Expanded(
                child: SizedBox(
              height: 44,
              child: TextFormField(
                maxLines: null,
                minLines: null,
                controller: controller,
                scrollPadding: EdgeInsets.only(bottom: 100),
                onSaved: onSaved,
                focusNode: focusNode,
                style: TextStyle(color: Color(0xFF222a59)),
                expands: true,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                cursorColor: Color(0xFF222a59),
                keyboardType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFF0000),
                      width: 2,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFF0000),
                      width: 2,
                    ),
                  ),
                  errorMaxLines: 1,
                  errorStyle: TextStyle(
                    color: const Color(0xFFFF0000),
                    fontSize: 0,
                    fontFamily: 'Inter',
                    height: 0.1,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFE6E6E6),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFE6E6E6),
                    ),
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
                  ),
                  label: Text(
                    easy.tr('phone_number'),
                    style: TextStyle(
                      color: const Color(0xFFCCCCCC),
                      fontSize: 16,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                validator: ValidationBuilder(requiredMessage: 'Please fill in correctly')
                    .required()
                    .phone('Please fill in correctly')
                    .maxLength(15, 'Please fill in correctly')
                    .build(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
