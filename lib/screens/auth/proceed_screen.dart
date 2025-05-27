// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launder_land/Providers/register_provider/register_provider.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/phone_number_field.dart';

class ProceedScreen extends ConsumerStatefulWidget {
  const ProceedScreen({super.key});

  @override
  ConsumerState<ProceedScreen> createState() => _ProceedScreenState();
}

class _ProceedScreenState extends ConsumerState<ProceedScreen> {
  final formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.white, // Fixed to white background
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
            child: Form(
              key: formKey,
              child: Column(
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
                      'Register',
                      style: TextStyle(
                        color: Color(0xFF222a59),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                  ),
                  Spacer(),
                  // Logo
                  Image.asset(
                    'assets/images/home-logo.png', // Update to your logo asset
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                  const SizedBox(height: 30),
                  // Subtitle
                  Text(
                    'Welcome to Launder Land create your account now',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFF222a59),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Phone Number Field
                  SizedBox(
                    width: 343,
                    child: PhoneNumberField(
                      controller: phoneController,
                      focusNode: phoneFocusNode,
                      onSaved: (newValue) {
                        setState(() {
                          ref
                              .read(registerProvider.notifier)
                              .setPhone(newValue!);
                        });
                      },
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
                    child: FilledButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          formKey.currentState?.save();
                          // pushScreenWithoutNavBar(
                          //     context,
                          //     RegisterScreen(
                          //       phoneNumber: phoneController.text,
                          //     ));
                          Operations().verifyMobileU2(
                              mobileNumber: Operations()
                                  .normalizeEgyptianNumber(
                                      phoneController.text),
                              context: context);
                        }
                      },
                      style: FilledButton.styleFrom(
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
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
