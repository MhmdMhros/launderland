import 'package:dio/dio.dart';
import 'package:launder_land/utils/constants.dart';
import 'package:launder_land/utils/http_util.dart';

class ApiService {
  Future<Response<dynamic>> getBanners() async {
    var url = ApiConstants.banners;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getCategories() async {
    var url = ApiConstants.categories;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getProducts(
      {required String categoryId, required int pageNum}) async {
    var url = ApiConstants.products +
        categoryId +
        ApiConstants.page +
        pageNum.toString();
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getOffers() async {
    var url = ApiConstants.coupons;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getSettings() async {
    var url = ApiConstants.settings;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getFaqs() async {
    var url = ApiConstants.faqs;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> checkUser(String phoneNumber) async {
    var url = ApiConstants.checkUser;
    Response<dynamic> response = await HttpUtil().post(url, data: {
      "mobile_number": phoneNumber,
      "email": "",
    });
    return response;
  }

  Future<Response<dynamic>> login(String token) async {
    var url = ApiConstants.login;
    Response<dynamic> response = await HttpUtil().post(url, data: {
      "token": token,
      "role": "customer",
    });
    return response;
  }

  Future<Response<dynamic>> register(Map<String, dynamic> registerData) async {
    var url = ApiConstants.register;
    Response<dynamic> response = await HttpUtil().post(url, data: registerData);
    return response;
  }

  Future<Response<dynamic>> deleteAccount(int id) async {
    var url = ApiConstants.deleteAccount + id.toString();
    Response<dynamic> response = await HttpUtil().post(url);
    return response;
  }

  Future<Response<dynamic>> getAddresses() async {
    var url = ApiConstants.addresses;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getWalletBalance() async {
    var url = ApiConstants.balance;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getTransactions() async {
    var url = ApiConstants.transactions;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> getOrders() async {
    var url = ApiConstants.orders;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> cancelOrder(int orderID) async {
    var url = '${ApiConstants.orders}/$orderID';
    Response<dynamic> response =
        await HttpUtil().put(url, data: {"status": "cancelled"});
    return response;
  }

  Future<Response<dynamic>> postOrder(Map<String, dynamic> orderRequest) async {
    var url = ApiConstants.orders;
    Response<dynamic> response = await HttpUtil().post(url, data: orderRequest);
    return response;
  }

  Future<Response<dynamic>> getPaymentMethods() async {
    var url = ApiConstants.paymentMethods;
    Response<dynamic> response = await HttpUtil().get(url);
    return response;
  }

  Future<Response<dynamic>> deposit(String amount) async {
    var url = ApiConstants.deposit;
    Response<dynamic> response = await HttpUtil().post(url, data: {
      "amount": amount,
      "payment_method_slug": "paymob",
    });
    return response;
  }

  Future<Response<dynamic>> paymobPayment(
      {required Map<String, dynamic> paymobMeta,
      required String paymentId}) async {
    var url = ApiConstants.paymob + paymentId;
    Response<dynamic> response = await HttpUtil().post(url, data: paymobMeta);
    return response;
  }

  Future<Response<dynamic>> addAddresses(
      Map<String, dynamic> addressData) async {
    var url = ApiConstants.addresses;
    Response<dynamic> response = await HttpUtil().post(url, data: addressData);
    return response;
  }

  Future<Response<dynamic>> submitSupport(
      Map<String, dynamic> supportData) async {
    var url = ApiConstants.support;
    Response<dynamic> response = await HttpUtil().post(url, data: supportData);
    return response;
  }

  Future<Response<dynamic>> registerU2(
      Map<String, dynamic> registerData) async {
    var url = ApiConstants.registerU2;
    Response<dynamic> response = await HttpUtil().post(url, data: registerData);
    return response;
  }

  Future<Response<dynamic>> loginU2(Map<String, dynamic> loginData) async {
    var url = ApiConstants.loginU2;
    Response<dynamic> response = await HttpUtil().post(url, data: loginData);
    return response;
  }

  Future<Response<dynamic>> verifyOtpU2(
      Map<String, dynamic> verifyOtpData) async {
    var url = ApiConstants.verifyOtpU2;
    Response<dynamic> response =
        await HttpUtil().post(url, data: verifyOtpData);
    return response;
  }

  Future<Response<dynamic>> verifyMobileU2(
      Map<String, dynamic> verifyMobileData) async {
    var url = ApiConstants.verifyMobileU2;
    Response<dynamic> response =
        await HttpUtil().post(url, data: verifyMobileData);
    return response;
  }

  Future<Response<dynamic>> sendOtpU2(Map<String, dynamic> sendOtpData) async {
    var url = ApiConstants.sendOtpU2;
    Response<dynamic> response = await HttpUtil().post(url, data: sendOtpData);
    return response;
  }
}
