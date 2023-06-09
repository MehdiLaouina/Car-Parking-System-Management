import 'dart:convert';
import 'package:application/models/map/parkings_model.dart';
import 'package:http/http.dart' as http;
import 'package:application/config.dart';
import 'package:application/services/shared_service.dart';

import '../models/admin/Admin.dart';
import '../models/admin/admin_login_request_model.dart';
import '../models/admin/admin_login_response_model.dart';
import '../models/admin/admin_register_request_model.dart';
import '../models/admin/admin_register_respone_model.dart';
import '../models/client/Client.dart';
import '../models/client/login_request_model.dart';
import '../models/client/login_response_model.dart';
import '../models/client/register_request_model.dart';
import '../models/client/register_response_model.dart';
import '../models/map/markers_model.dart';
import '../models/reservation/reservations_model.dart';

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

  static Future<bool> logOut() async {
    var loginDetails = await SharedService.loginDetails();

    loginDetails!.data.token = '';
    return true;
  }

  static Future<Client?> getClientProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.clientProfileAPI);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return clientJson(response.body);
    } else {
      return null;
    }
  }

  static Future<Admin?> getAdminProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.adminProfileAPI);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return adminJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ParkingsModel?> getMap() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer ${loginDetails!.data.token}',
      'content-Type': "application/json"
    };

    var url = Uri.http(Config.apiURL, Config.map);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return parkingsModelJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ParkingsModel?> getParkingDetail() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.adminOwning);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return parkingsModelJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ReservationsModel?> getReservationDetail() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.clientReservations);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return reservationsModelJson(response.body);
    } else {
      return null;
    }
  }

  static Future<String?> test() async {
    var request =
        http.MultipartRequest('POST', Uri.parse('http://localhost:3001/image'));
    request.files.add(await http.MultipartFile.fromPath('image',
        '/C:/Users/ahmed/Documents/Ai/workingDirectory/darknet/data/obj/00d90448dcea9140.jpg'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return response.reasonPhrase;
    }
  }
}
