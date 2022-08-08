import 'dart:convert';
import 'package:climate_hackerz/network/secrets.dart';
import 'package:http/http.dart' as http;

import '../shared/local_db.dart';


/**
Authentication API class for user data management 
deals with authrozation header using POST,PATCH

 */

class AuthAPI {
//create a static promise method that ties quesry to api
  static Future login(id, password) async {
    //attach base to quesry 
    var data = "find";
    var changePasswordUrl = "/api/login";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {"email": id, "password": password};
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
   
    };
    final uri = Uri.http(
      BASEURL,
      changePasswordUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  //create a static promise method that ties quesry to api
  static Future signup(email, password,isDone) async {
    //attach base to quesry
    var signupUrl = "/api/register";

    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
     "isKYCDone":isDone
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
   
    };
    final uri = Uri.http(
      BASEURL,
      signupUrl,
    );
    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }


  static Future userKYC(firstName, lastName, gender, isDone, phone, username, city,
      state) async {
    var id = await UserPrefrences.showID();
    //attach base to quesry
    var userKYCUrl = "/api/update/$id";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      "name": firstName,
      "surname": lastName,
      "username":username,
      "isKYCDone":isDone,
      "gender": gender,
      "phoneNumber": phone,
      "city": city,
      "state": state,
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
     
    };

   
    final uri = Uri.http(BASEURL, userKYCUrl,);

    //return parsed api
    return await http.patch(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

   static Future saveWallet(address, phrase, key) async {
    var id = await UserPrefrences.showID();
    //attach base to quesry
    var userKYCUrl = "/api/update/$id";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      
      "address": address,
      "mnenomics": phrase,
      "privateKey": key,
      
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
     
    };

   
    final uri = Uri.http(BASEURL, userKYCUrl,);

    //return parsed api
    return await http.patch(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

  
}