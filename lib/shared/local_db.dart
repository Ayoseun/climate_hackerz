import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {

  static  saveEmail(email) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("email", email);
    print('done');
  }

 static Future showEmail() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("email");

    return temp;
  }


  static  saveID(id) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("id", id);
    print('done');
  }

 static Future showID() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("id");

    return temp;
  }


  static  saveAddress(add) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("add", add);
    print('done');
  }

 static Future showAddress() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("add");

    return temp;
  }


  static  savePrivateKey(pk) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("pk", pk);
    print('done');
  }

 static Future showPrivateKey() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("pk");

    return temp;
  }


  static  savePhrase(phrase) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("phrase", phrase);
    print('phrase');
  }

 static Future showPhrase() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("phrase");

    return temp;
  }


  static  saveName(name) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("name", name);
    print('done');
  }

 static Future showName() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("name");

    return temp;
  }


  static  saveSurname(sur) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("sur", sur);
    print('done');
  }

 static Future showSurname() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("sur");

    return temp;
  }


 static  saveUsername(user) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("user", user);
    print('done');
  }

 static Future showUsername() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("user");

    return temp;
  }


  static  saveBalance(bal) async {
    
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    await s_prefs.setString("bal", bal);
    print('done');
  }

 static Future showBalance() async {
    SharedPreferences s_prefs = await SharedPreferences.getInstance();

    String? temp = await s_prefs.getString("bal");

    return temp;
  }



















}
class Storage {
  static Future balance(String Save) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('balance', Save);
    // print('object');
  }

  static Future<dynamic> getAlreadyAUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool('alreadyAUser');
    return value;
  }

  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', 123);
  }

  static Future oneTime<int>() async {
    var once = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', once);
    if (once == 0) {
      prefs.setInt('intValue', once);
    } else {
      return once;
    }
  }

  addDoubleToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('doubleValue', 115.0);
  }


  static Future<bool> setToken(dynamic token) async {
    var commit = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', jsonEncode(token));
    commit = true;
    return commit;
  }

  static void removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', true);
  }

  static getBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('balance');
    return stringValue!;
  }

  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool('boolValue');
    return boolValue;
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt('intValue');
    return intValue;
  }

  getDoubleValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble('doubleValue');
    return doubleValue;
  }
}

class IsFirstTime {
  Future<int> getOnce() async {
    int? intValue=0;
     //intValue = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    if (prefs.getInt("initScreen") == null) {
      intValue = 0;
    } else {
      intValue = prefs.getInt("initScreen");
    }

    return intValue!;
  }

  Future once(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //initScreen
    await prefs.setInt("initScreen", num);

    int initScreen = (prefs.getInt("initScreen"))!;

    // return initScreen;
  }
}

class IsKYC {
  Future<int> getOnce() async {
    int? intValue=0;
     //intValue = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    if (prefs.getInt("isKYCDone") == null) {
      intValue = 0;
    } else {
      intValue = prefs.getInt("isKYCDone");
    }

    return intValue!;
  }

  Future once(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //initScreen
    await prefs.setInt("isKYCDone", num);

    int initScreen = (prefs.getInt("isKYCDone"))!;

    // return initScreen;
  }
}
