import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:launder_land/Providers/register_provider/register_provider.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/custom_alert_dialog.dart';
import 'package:launder_land/widgets/custom_text_field.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void onSend() async {
      if (formKey.currentState?.validate() == true) {
        formKey.currentState?.save();
        ref.read(registerProvider.notifier).setPhone(widget.phoneNumber);
        final registerData = ref.watch(registerProvider).toJson();
        log(registerData.toString());
        CustomAlertDialog().showCustomDialog(
          context: context,
          title: widget.phoneNumber,
          subtitle: 'number_confirmation'.tr(),
          onConfirm: () async {
            await Operations().registerU2(
                registerData: registerData,
                mobileNumber: widget.phoneNumber,
                context: context);
            if (!mounted) return;
          },
        );
      }
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: LoaderOverlay(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg.png', // Add an asset with yellow/green circles
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topRight,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF222a59),
                                size: 24,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            title: const Text(
                              'Registration',
                              style: TextStyle(
                                color: Color(0xFF222a59),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            centerTitle: true,
                          ),
                          const SizedBox(height: 20),
                          // Logo
                          Image.asset(
                            'assets/images/home-logo.png',
                            fit: BoxFit.cover,
                            width: 356.93,
                            height: 169,
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: const [
                              Text(
                                'WELCOME TO LAUNDERLAND',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF222a59),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'CREATE YOUR ACCOUNT NOW',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF222a59),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          // Name Field
                          SizedBox(
                            width: 343,
                            child: CustomTextField(
                              textCapitalization: TextCapitalization.words,
                              validator: ValidationBuilder(
                                      requiredMessage:
                                          'Please fill in correctly')
                                  .required()
                                  .minLength(2, 'Please fill in correctly')
                                  .maxLength(50, 'Please fill in correctly')
                                  .build(),
                              label: 'Name',
                              onSaved: (p0) => ref
                                  .read(registerProvider.notifier)
                                  .setName(p0 ?? ''),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Email Field
                          SizedBox(
                            width: 343,
                            child: CustomTextField(
                              keyboardType: TextInputType.emailAddress,
                              validator: ValidationBuilder(
                                      requiredMessage:
                                          'Please fill in correctly')
                                  .required()
                                  .email('Please fill in correctly')
                                  .maxLength(50, 'Please fill in correctly')
                                  .build(),
                              label: 'Email Address',
                              onSaved: (p0) => ref
                                  .read(registerProvider.notifier)
                                  .setEmail(p0 ?? ''),
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Register Button
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: const Offset(4, 8),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: ElevatedButton(
                              onPressed: onSend,
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(236, 55),
                                minimumSize: const Size(236, 55),
                                backgroundColor: const Color(0xFF222a59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Text(
                                'register'.tr(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
