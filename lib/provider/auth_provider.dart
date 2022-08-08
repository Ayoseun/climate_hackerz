import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:climate_hackerz/shared/local_db.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../constants/resources.dart';
import 'dart:convert' as convert;
import '../network/auth.dart';


class AuthProvider extends ChangeNotifier {
  Future<Map<String, dynamic>> login(email, pw) async {
    dynamic data;
    notifyListeners();

    try {
      var response = await AuthAPI.login(email, pw);
      var responseData = json.decode(response.body);

      notifyListeners();

      data = responseData;
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }


  Future<Map<String, dynamic>> register(email, pw, isDone) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.signup(email, pw,isDone);
      var responseData = json.decode(response.body);
      notifyListeners();
     
        data = responseData;
      
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }


  Future<Map<String, dynamic>> KYC(firstName, lastName, gender, isDone, phone, username, city,
      state) async {
    dynamic data;

    notifyListeners();

    try {
      var response = await AuthAPI.userKYC(firstName, lastName, gender, isDone, phone, username, city,
      state);
      var responseData = json.decode(response.body);
     
      notifyListeners();
 
        data = responseData;
       
    
    
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }
}


// To parse this JSON data, do
//
//     final policyData = policyDataFromMap(jsonString);

