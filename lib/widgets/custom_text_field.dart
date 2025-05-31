import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.validator,
    required this.label,
    this.controller,
    this.onSaved,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.focusNode,
    this.onChanged,
    this.textCapitalization,
    this.isFinal = false,
    this.isMultiLine = false,
    this.readOnly = false,
    this.labelColor,
    this.isMapSearch = false,
  });
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String label;
  final TextInputType? keyboardType;
  final bool isMultiLine;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Color? labelColor;
  final bool isFinal;
  final bool readOnly;
  final bool isMapSearch;

  @override
  Widget build(BuildContext context) {
    late final FocusNode node = focusNode ?? FocusNode();

    return TextFormField(
      initialValue: initialValue,
      focusNode: node,
      readOnly: readOnly,
      scrollPadding: EdgeInsets.only(bottom: 100),
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLines: isMultiLine ? 3 : null,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onChanged: onChanged,
      textInputAction: isFinal ? TextInputAction.done : TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onSaved: onSaved,
      style: TextStyle(color: Color(0xFF222a59)),
      cursorColor: Color(0xFF222a59),
      decoration: InputDecoration(
        prefixIcon: isMapSearch ? const Icon(Icons.map) : null,
        suffixIcon: isMapSearch
            ? IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  if (controller != null) controller?.clear();
                },
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorMaxLines: 1,
        errorStyle: TextStyle(
          color: const Color(0xFFFF0000),
          fontSize: 0,
          fontFamily: 'Inter',
          height: 0,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: label,
        label: Text(
          label,
          style: TextStyle(
            color: labelColor ?? const Color(0xFFCCCCCC),
            fontSize: 16,
            fontFamily: 'Inter',
          ),
        ),
      ),
      validator: validator,
    );
  }
}
