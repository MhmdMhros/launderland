import 'dart:developer';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launder_land/Providers/theme_provider/theme_provider.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  bool canResend = false;
  int resendCountdown = 24; // 24 seconds countdown
  late Timer _timer;
  final TextEditingController pinController = TextEditingController();

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
    setTheme();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    canResend = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendCountdown > 0) {
        setState(() {
          resendCountdown--;
        });
      } else {
        setState(() {
          canResend = true;
          _timer.cancel();
        });
      }
    });
  }

  // void verifyOtp(String pin) async {
  //   try {
  //     if (pin == '123456') {
  //       // Simulate successful verification with default OTP
  //       Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => Root()),
  //         (Route<dynamic> route) => false,
  //       );
  //     } else {
  //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: widget.verificationId,
  //         smsCode: pin,
  //       );

  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //       if (mounted) {
  //         Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (context) => Root()),
  //           (Route<dynamic> route) => false,
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     log('Error verifying OTP: $e');
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Invalid OTP. Please try again.')),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF222a59)),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                centerTitle: true,
                title: Text(
                  'OTP Verification',
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
              Text(
                'Check Your Messages 📩',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF21295A),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We\'ve Sent A Code To Your Mobile Number, Enter It Below To Continue.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF21295A),
                ),
              ),
              SizedBox(height: 38),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  closeKeyboardWhenCompleted: true,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  length: 6,
                  onCompleted: (pin) {
                    Operations().verifyOtpU2(
                        mobileNumber: widget.phoneNumber,
                        otp: pin,
                        context: context);
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code yet?",
                    style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: canResend ? resendU2 : null,
                    child: Text(
                      'Resend OTP in ${resendCountdown}s',
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            canResend ? Color(0xFF222a59) : Color(0xFF999999),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: pinController.text.length == 6
                      ? () {
                          // Operations().verifyOtp(
                          //     pinCode: pinController.text,
                          //     verificationId: widget.verificationId,
                          //     context: context);
                          Operations().verifyOtpU2(
                              mobileNumber: widget.phoneNumber,
                              otp: pinController.text,
                              context: context);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pinController.text.length == 6
                        ? Color(0xFF222a59)
                        : Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(236, 55),
                    minimumSize: Size(236, 55),
                    maximumSize: Size(236, 55),
                  ),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // void resend() {
  //   FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: widget.phoneNumber,
  //     verificationCompleted: (phoneAuthCredential) {
  //       pinController.text = phoneAuthCredential.smsCode ?? '';
  //     },
  //     verificationFailed: (error) {
  //       log('firebase error: $error');
  //     },
  //     codeSent: (verificationId, forceResendingToken) {
  //       setState(() {
  //         resendCountdown = 24;
  //         startTimer();
  //       });
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {
  //       log('Auto Retrieval timeout error');
  //     },
  //   );
  // }

  void resendU2() {
    Operations()
        .sendOtpU2(mobileNumber: widget.phoneNumber, context: context)
        .then((onValue) {
      if (onValue) {
        setState(() {
          resendCountdown = 24;
          startTimer();
        });
      }
    }).catchError((error) {
      log('firebase error: $error');
    });
  }
}
