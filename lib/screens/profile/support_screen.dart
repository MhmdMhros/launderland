import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:form_validator/form_validator.dart';
import 'package:launder_land/models/support_model/support_model.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onSend() async {
      if (formKey.currentState?.validate() == true) {
        formKey.currentState?.save();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final userPhone = prefs.getString('userPhone') ?? '';
        final userName = prefs.getString('userName') ?? '';
        final message = messageController.text;
        final email = prefs.getString('userEmail') ?? '';
        if (context.mounted) {
          Operations()
              .submitSupport(
                  supportData: SupportModel(
                    message: message,
                    name: userName,
                    mobile_number: userPhone,
                    email: email,
                  ).toJson(),
                  context: context)
              .then(
            (value) {
              if (context.mounted) Navigator.pop(context);
            },
          );
        }
      }
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(title: Text(easy.tr('support'))),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/Logo.png',
                        width: MediaQuery.of(context).size.height * 0.125,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'write_to_us'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'get_back_to_you'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextField(
                      validator: ValidationBuilder().required().build(),
                      label: 'your_message'.tr(),
                      isMultiLine: true,
                      controller: messageController,
                    ),
                  ),
                  Spacer(),
                  SafeArea(
                    child: FilledButton(
                      onPressed: onSend,
                      style: FilledButton.styleFrom(
                        fixedSize: const Size(343, 50),
                        minimumSize: const Size(343, 50),
                        backgroundColor: const Color(0xFF222a59),
                      ),
                      child: Text(
                        'submit'.tr(),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
