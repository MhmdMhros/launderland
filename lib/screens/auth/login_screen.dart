// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:launder_land/Providers/phone_number_provider/phone_number_provider.dart';
import 'package:launder_land/Providers/theme_provider/theme_provider.dart';
import 'package:launder_land/utils/num_keyboard.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/custom_alert_dialog.dart';
import 'package:launder_land/widgets/phone_number_field.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import the OTP screen

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key, this.phoneNumber});
  final String? phoneNumber;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController phoneController = TextEditingController();

  String theme = 'light';

  void setTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme');
    if (savedTheme == null) {
      theme = await ref.watch(themeProvider.future);
      await prefs.setString('theme', theme);
    } else {
      setState(() {
        theme = savedTheme;
      });
      ref.watch(themeProvider.notifier).setTheme(theme);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.phoneNumber != null) {
      phoneController.text = widget.phoneNumber!;
    }
    setTheme();
  }

  @override
  Widget build(BuildContext context) {
    void onSend() async {
      if (formKey.currentState?.validate() == true) {
        formKey.currentState?.save();
        final phoneNumber = ref.watch(phoneProvider);

        CustomAlertDialog().showCustomDialog(
          context: context,
          title: phoneNumber,
          subtitle: 'number_confirmation'.tr(),
          onConfirm: () {
            // Operations().checkUser(phoneNumber: phoneNumber, context: context);
            Operations().loginU2(
                mobileNumber: Operations().normalizeEgyptianNumber(phoneNumber),
                context: context);
          },
        );
      }
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: LoaderOverlay(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
            child: Form(
              key: formKey,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: KeyboardActions(
                  disableScroll: true,
                  config: keyboardActionsConfig(
                    focusNode: phoneFocusNode,
                    isFinal: true,
                  ),
                  child: Column(
                    children: [
                      AppBar(
                        centerTitle: true,
                        title: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),

                      Spacer(),
                      Image.asset(
                        'assets/images/home-logo.png', // Update to your logo asset
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      const SizedBox(height: 80),
                      Text(
                        'LOGIN TO YOUR ACCOUNT',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF222a59),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Phone Number Field
                      SizedBox(
                        width: 343,
                        child: PhoneNumberField(
                          controller: phoneController,
                          focusNode: phoneFocusNode,
                          onSaved: (newValue) {
                            setState(() {
                              ref
                                  .read(phoneProvider.notifier)
                                  .setPhone(newValue!);
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Login Button
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 1,
                              blurRadius: 8, // حجم الظل
                              offset: const Offset(4, 8), // تحريك الظل
                            ),
                          ],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: FilledButton(
                          onPressed: () {
                            onSend();
                          },
                          style: FilledButton.styleFrom(
                            fixedSize: const Size(263, 55),
                            minimumSize: const Size(263, 55),
                            backgroundColor: const Color(0xFF222a59),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
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
        ),
      ),
    );
  }
}
