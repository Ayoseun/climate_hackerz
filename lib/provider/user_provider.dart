import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import '../network/wallet.dart';


class UserProvider extends ChangeNotifier {
  Future<Map<String, dynamic>> generate() async {
    dynamic data;
    notifyListeners();

    try {
      var response = await UserAPI.genarate();
      var responseData = json.decode(response.body);

      notifyListeners();

      data = responseData;
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

Future<Map<String, dynamic>> fund() async {
    dynamic data;
    notifyListeners();

    try {
      var response = await UserAPI.fund();
      var responseData = json.decode(response.body);

      notifyListeners();

      data = responseData;
    } catch (e) {
      notifyListeners();
      data = {'error': e};
    }
    return data;
  }

    Future<Map<String, dynamic>> balance() async {
    dynamic data;
    notifyListeners();

    try {
      var response = await UserAPI.balance();
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