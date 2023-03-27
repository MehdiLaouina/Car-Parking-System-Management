import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:application/config.dart';
import 'package:application/models/login_request_model.dart';
import 'package:application/models/login_response_model.dart';
import 'package:application/services/shared_service.dart';

import '../models/admin_login_request_model.dart';
import '../models/admin_login_response_model.dart';
import '../models/admin_register_request_model.dart';
import '../models/admin_register_respone_model.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginClientAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      //client succefully logged in
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerClientAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return registerResponseModel(response.body);
  }

  //admin
  static Future<bool> adminLogin(AdminLoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAdminAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      //client succefully logged in
      await SharedService.setAdminLoginDetails(
          adminLoginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<AdminRegisterResponseModel> adminRegister(
      AdminRegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAdminAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return adminRegisterResponseModel(response.body);
  }
}
