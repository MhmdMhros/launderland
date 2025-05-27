// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:launder_land/models/address_model/address_model.dart';
import 'package:launder_land/models/banner_model/banner_model.dart';
import 'package:launder_land/models/category_model/category_model.dart';
import 'package:launder_land/models/created_order_model.dart';
import 'package:launder_land/models/faqs_model/faqs_model.dart';
import 'package:launder_land/models/orders_model.dart';
import 'package:launder_land/models/payment_methods_model/payment_methods_model.dart';
import 'package:launder_land/models/products_model.dart';
import 'package:launder_land/models/settings_model/settings_model.dart';
import 'package:launder_land/models/transactions_model.dart';
import 'package:launder_land/models/user_model/user_model.dart';
import 'package:launder_land/models/wallet_deposit_model/wallet_deposit_model.dart';
import 'package:launder_land/root.dart';
import 'package:launder_land/screens/auth/login_screen.dart';
import 'package:launder_land/screens/auth/otp_screen.dart';
import 'package:launder_land/screens/auth/proceed_screen.dart';
import 'package:launder_land/screens/auth/register_screen.dart';
import 'package:launder_land/utils/api_services.dart';
import 'package:launder_land/widgets/custom_alert_dialog.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Operations {
  Future<List<BannerModel>> homeBanners() async {
    final response = await ApiService().getBanners();
    if (response.statusCode == 200) {
      List<BannerModel> banners = [];
      for (var banner in response.data['data']) {
        banners.add(BannerModel.fromJson(banner));
      }
      banners.sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));
      return banners;
    }
    return [];
  }

  Future<List<CategoryModel>> homeCategories() async {
    final response = await ApiService().getCategories();
    if (response.statusCode == 200) {
      List<CategoryModel> categories = [];
      for (var category in response.data['data']) {
        categories.add(CategoryModel.fromJson(category));
      }
      categories.sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));
      return categories;
    }
    return [];
  }

  Future<ProductsModel> categoryProducts(
      {required String categoryId, required int pageNum}) async {
    final response = await ApiService()
        .getProducts(categoryId: categoryId, pageNum: pageNum);
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(response.data);
    }
    return ProductsModel();
  }

  Future<List> getOffers() async {
    final response = await ApiService().getOffers();
    if (response.statusCode == 200) {
      return response.data;
    }
    return [];
  }

  Future<List<SettingsModel>> getSettings() async {
    final response = await ApiService().getSettings();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      List<SettingsModel> settings = [];
      for (var setting in response.data) {
        settings.add(SettingsModel.fromJson(setting));
      }
      String standardDeliveryFee = settings
          .firstWhere((element) => element.key == 'delivery_fee')
          .value!;
      String expressDeliveryFee = settings
          .firstWhere((element) => element.key == 'fast_delivery_fee')
          .value!;
      String sosDeliveryFee = settings
          .firstWhere((element) => element.key == '2hour_delivery_fee')
          .value!;
      String timeSlots =
          settings.firstWhere((element) => element.key == 'time_slots').value!;

      prefs.setInt('standardDeliveryFee', int.parse(standardDeliveryFee));
      prefs.setDouble('expressDeliveryFee', double.parse(expressDeliveryFee));
      prefs.setDouble('sosDeliveryFee', double.parse(sosDeliveryFee));
      prefs.setString('time_slots', timeSlots);

      return settings;
    }
    return [];
  }

  Future<List<FaqsModel>> getFaqs() async {
    final response = await ApiService().getFaqs();
    if (response.statusCode == 200) {
      List<FaqsModel> faqs = [];
      for (var faq in response.data) {
        faqs.add(FaqsModel.fromJson(faq));
      }
      return faqs;
    }
    return [];
  }

  Future<void> checkUser(
      {required String phoneNumber, required BuildContext context}) async {
    context.loaderOverlay.show();

    final response = await ApiService().checkUser(phoneNumber);
    showToast('Yes: ${response.statusCode}');
    log('Yes: ${response.statusCode}');

    if (response.statusCode == 200) {
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          context.loaderOverlay.hide();
        },
        verificationFailed: (error) {
          context.loaderOverlay.hide();
          log('firebase error: $error');
        },
        codeSent: (verificationId, forceResendingToken) {
          context.loaderOverlay.hide();
          pushReplacementWithoutNavBar(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                      // verificationId: verificationId,
                      phoneNumber: phoneNumber)));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          context.loaderOverlay.hide();
          log('Auto Retrieval timeout error');
        },
      );
    } else if (response.statusCode == 302) {
      final String localNumber = PhoneNumber.parse(phoneNumber).nsn;
      if (context.mounted) {
        pushScreenWithoutNavBar(
            context, RegisterScreen(phoneNumber: localNumber));
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
      }
      log(response.statusCode.toString());
    }
  }

  void verifyOtp(
      {required String pinCode,
      required String verificationId,
      required BuildContext context}) async {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: pinCode);
      await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async {
          if (value.user != null) {
            value.user!.getIdToken().then((token) {
              if (context.mounted) {
                _login(token: token ?? '', context: context);
              }
            });
          }
        },
      );
    } catch (e) {
      log('error: $e');
    }
  }

  Future<void> _login(
      {required String token, required BuildContext context}) async {
    final response = await ApiService().login(token);
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final user = UserModel.fromJson(response.data);
      prefs.setString('userName', user.user!.name!);
      prefs.setString('userPhone', user.user!.mobileNumber!);
      prefs.setString('token', user.token!);
      prefs.setString('userEmail', user.user!.email!);
      prefs.setInt('userId', user.user!.id!);
      if (context.mounted) {
        pushReplacementWithoutNavBar(
            context, MaterialPageRoute(builder: (context) => Root()));
      }
    } else {}
  }

  Future<void> logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut().then(
      (value) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var flutterCart = FlutterCart();
        flutterCart.clearCart();
        prefs.remove('token');
        prefs.remove('userName');
        prefs.remove('userPhone');
        prefs.remove('userId');
        if (context.mounted) {
          pushReplacementWithoutNavBar(
              context, MaterialPageRoute(builder: (context) => Root()));
        }
      },
    );
  }

  Future<void> deleteAccount({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userID = prefs.getInt('userId');
    FirebaseAuth.instance.currentUser!.delete().then(
      (value) async {
        await ApiService().deleteAccount(userID!);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('userName');
        prefs.remove('userPhone');
        prefs.remove('userId');
        if (context.mounted) {
          pushReplacementWithoutNavBar(
              context, MaterialPageRoute(builder: (context) => Root()));
        }
      },
    ).catchError((error) {
      log('error: $error');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
      }
    });
  }

  Future<List<AddressModel>?> getAddresses() async {
    final response = await ApiService().getAddresses();
    if (response.statusCode == 200) {
      List<AddressModel> addresses = [];
      for (var address in response.data) {
        addresses.add(AddressModel.fromJson(address));
      }
      return addresses;
    }
    return [];
  }

  Future<int?> getWalletBalance() async {
    final response = await ApiService().getWalletBalance();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      prefs.setInt('walletBalance', response.data['balance']);
      return response.data['balance'];
    }
    return null;
  }

  Future<TransactionsModel?> getTransactions() async {
    final response = await ApiService().getTransactions();
    if (response.statusCode == 200) {
      return TransactionsModel.fromJson(response.data);
    }
    return null;
  }

  Future<CreatedOrderModel?> postOrder(
      Map<String, dynamic> orderRequest, BuildContext context) async {
    context.loaderOverlay.show();
    final response = await ApiService().postOrder(orderRequest);

    if (response.statusCode == 200) {
      if (context.mounted) context.loaderOverlay.hide();
      return (CreatedOrderModel.fromJson(response.data));
    }
    if (context.mounted) context.loaderOverlay.hide();
    return null;
  }

  Future<OrdersModel?> getOrders() async {
    final response = await ApiService().getOrders();
    if (response.statusCode == 200) {
      return OrdersModel.fromJson(response.data);
    }
    return null;
  }

  Future<List<PaymentMethodsModel>?> getPaymentMethods() async {
    final response = await ApiService().getPaymentMethods();
    if (response.statusCode == 200) {
      List<PaymentMethodsModel> paymentMethods = [];
      for (var method in response.data) {
        paymentMethods.add(PaymentMethodsModel.fromJson(method));
      }
      return paymentMethods;
    }
    return null;
  }

  Future<void> register(
      {required Map<String, dynamic> registerData,
      required BuildContext context}) async {
    context.loaderOverlay.show();
    final response = await ApiService().register(registerData);
    if (response.statusCode == 200) {
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: registerData['mobile_number'],
        verificationCompleted: (phoneAuthCredential) {
          context.loaderOverlay.hide();
        },
        verificationFailed: (error) {
          context.loaderOverlay.hide();
          log('firebase error: $error');
        },
        codeSent: (verificationId, forceResendingToken) {
          context.loaderOverlay.hide();
          pushScreenWithoutNavBar(
              context,
              OtpScreen(
                  // verificationId: verificationId,
                  phoneNumber: registerData['mobile_number']!));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          context.loaderOverlay.hide();
          log('Auto Retrieval timeout error');
        },
      );
    } else if (response.statusCode == 302) {
      final String localNumber =
          PhoneNumber.parse(registerData['mobile_number']).nsn;
      if (context.mounted) {
        CustomAlertDialog().showCustomDialog(
          context: context,
          title: 'Error',
          subtitle: 'user already exists',
          confirmText: "login",
          cancelText: "cancel",
          onConfirm: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginScreen(phoneNumber: localNumber)));
          },
        );
      }

      log(response.data.toString());
    } else {
      log(response.statusCode.toString());
    }
  }

  Future<WalletDepositModel?> deposit(
      {required String amount, required BuildContext context}) async {
    context.loaderOverlay.show();
    final response = await ApiService().deposit(amount);
    if (response.statusCode == 201) {
      if (context.mounted) {
        context.loaderOverlay.hide();
      }
      final walletDeposit = WalletDepositModel.fromJson(response.data);
      return walletDeposit;
    } else {
      if (context.mounted) {
        context.loaderOverlay.hide();
      }
      return null;
    }
  }

  Future<String> paymob(
      {required Map<String, dynamic> paymobMeta,
      required String paymentId}) async {
    final response = await ApiService()
        .paymobPayment(paymobMeta: paymobMeta, paymentId: paymentId);
    if (response.statusCode == 200) {
      return response.data['iframeURL'];
    }
    return '';
  }

  Future<AddressModel?> addAddress(
      {required Map<String, dynamic> addressData,
      required BuildContext context}) async {
    final response = await ApiService().addAddresses(addressData);
    if (response.statusCode == 201) {
      return AddressModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<void> submitSupport(
      {required Map<String, dynamic> supportData,
      required BuildContext context}) async {
    final response = await ApiService().submitSupport(supportData);
    if (response.statusCode == 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Query Submitted Successfully'),
        ));
      }
      log('success');
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
      }
      log('failed');
    }
  }

  updateAddress(
      {required BuildContext context,
      required int addressId,
      required Map<String, dynamic> addressData}) {}

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  int getMobileOperatorCode(String mobileNumber) {
    if (!RegExp(r'^01[0-5][0-9]{8}$').hasMatch(mobileNumber)) {
      return 0;
    }

    final prefix = mobileNumber.substring(0, 3);

    switch (prefix) {
      case '010':
        return 1; // Vodafone
      case '011':
        return 2; // Etisalat
      case '012':
        return 3; // Orange
      case '015':
        return 7; // WE
      default:
        return 0; // Unknown
    }
  }

  String normalizeEgyptianNumber(String number) {
    number = number.replaceAll(' ', '');
    if (number.startsWith('+20')) {
      number = number.substring(3);
    } else if (number.startsWith('0020')) {
      number = number.substring(4);
    }
    if (!number.startsWith('0')) {
      number = '0$number';
    }
    return number;
  }

  // loginU2 => check mobile exist or not if exist status code is 200 and send otp if not exist status code is 302.
  Future<void> loginU2(
      {required String mobileNumber, required BuildContext context}) async {
    context.loaderOverlay.show();

    final response = await ApiService().loginU2({
      "mobile_number": mobileNumber,
      "operator_id": "${getMobileOperatorCode(mobileNumber)}"
    });
    if (response.statusCode == 200) {
      // user exist
      context.loaderOverlay.hide();
      pushReplacementWithoutNavBar(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(phoneNumber: mobileNumber)));
    } else if (response.statusCode == 302) {
      // user not exist
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User not found'),
      ));
      pushScreenWithoutNavBar(context, ProceedScreen());
    } else {
      context.loaderOverlay.hide();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
      }
    }
  }

  // verify_mobileU2 => check mobile exist or not if exist status code is 200 is not exist status code is 302.
  Future<void> verifyMobileU2(
      {required String mobileNumber, required BuildContext context}) async {
    context.loaderOverlay.show();

    final response = await ApiService().verifyMobileU2({
      "mobile_number": mobileNumber,
    });
    if (response.statusCode == 200) {
      // user exist
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User already exist'),
      ));
      pushReplacementWithoutNavBar(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    phoneNumber: mobileNumber,
                  )));
    } else if (response.statusCode == 302) {
      // user not exist
      context.loaderOverlay.hide();
      pushScreenWithoutNavBar(
          context, RegisterScreen(phoneNumber: mobileNumber));
    } else {
      context.loaderOverlay.hide();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
      }
    }
  }

  // registerU2 => check email and mobile number exist or not if exist status code is 422 if not exist status code is 200 and send otp.
  Future<void> registerU2(
      {required Map<String, dynamic> registerData,
      required String mobileNumber,
      required BuildContext context}) async {
    context.loaderOverlay.show();
    final response = await ApiService().registerU2(registerData);
    if (response.statusCode == 200) {
      context.loaderOverlay.hide();
      pushReplacementWithoutNavBar(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(phoneNumber: mobileNumber)));
    } else if (response.statusCode == 422 || response.statusCode == 302) {
      // user exist
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Email already exist'),
      ));
    } else {
      context.loaderOverlay.hide();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
      }
    }
  }

  // verify_otpU2 => check otp if done status code is 200 and response is user data if not done status code is 410.
  Future<void> verifyOtpU2(
      {required String mobileNumber,
      required String otp,
      required BuildContext context}) async {
    context.loaderOverlay.show();

    final response = await ApiService().verifyOtpU2({
      "phone": mobileNumber,
      "otp": otp,
    });
    if (response.statusCode == 200) {
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully!!!'),
      ));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final user = UserModel.fromJson(response.data);
      prefs.setString('userName', user.user!.name!);
      prefs.setString('userPhone', user.user!.mobileNumber!);
      prefs.setString('token', user.token!);
      prefs.setString('userEmail', user.user!.email!);
      prefs.setInt('userId', user.user!.id!);
      if (context.mounted) {
        pushReplacementWithoutNavBar(
            context, MaterialPageRoute(builder: (context) => Root()));
      }
    } else if (response.statusCode == 410) {
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('OTP expired or not found.'),
      ));
    } else {
      context.loaderOverlay.hide();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong please try again'),
        ));
      }
    }
  }

  // send_otp => send otp to prosess and enter if otp sent status code is 200 else status code is 422.

  Future<bool> sendOtpU2(
      {required String mobileNumber, required BuildContext context}) async {
    context.loaderOverlay.show();
    final response = await ApiService().sendOtpU2({
      "phone": mobileNumber,
      "operator_id": "${getMobileOperatorCode(mobileNumber)}"
    });
    if (response.statusCode == 200) {
      context.loaderOverlay.hide();
      return true;
    } else {
      context.loaderOverlay.hide();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
        return false;
      }
      return false;
    }
  }

  Future<void> deleteAccountU2({required BuildContext context}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userID = prefs.getInt('userId');
    final response = await ApiService().deleteAccount(userID!);
    if (response.statusCode == 200) {
      prefs.remove('token');
      prefs.remove('userName');
      prefs.remove('userPhone');
      prefs.remove('userId');
      if (context.mounted) {
        pushReplacementWithoutNavBar(
            context, MaterialPageRoute(builder: (context) => Root()));
      }
    } else {
      log('Failed');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong'),
        ));
      }
    }
  }
}
