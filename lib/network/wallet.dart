import 'dart:convert';

import 'package:climate_hackerz/network/secrets.dart';
import 'package:http/http.dart' as http;

import '../shared/local_db.dart';

class UserAPI {
//create a static promise method that ties quesry to api
  static Future genarate() async {
    //attach base to quesry 
   
    var createUrl = "/api/createAddress";
    final encoding = Encoding.getByName('utf-8');
  
    final headers = {
      'Content-Type': 'application/json',
   
    };
    final uri = Uri.http(
      BASEURL,
      createUrl,
    );
    //return parsed api
    return await http.get(
      uri,
      headers: headers,
     
    );
  }



   static Future balance() async {
    var address = await UserPrefrences.showAddress();
    //attach base to quesry
    var balanceUrl = "/api/balance";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      
      "address": address,
      
      
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
     
    };

   
    final uri = Uri.http(BASEURL, balanceUrl,);

    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }

   static Future fund() async {
    var address = await UserPrefrences.showAddress();
    //attach base to quesry
    var fundUrl = "/api/fund";
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      
      "address": address,
      
      
    };
    String jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json',
     
    };

   
    final uri = Uri.http(BASEURL, fundUrl,);

    //return parsed api
    return await http.post(
      uri,
      headers: headers,
      encoding: encoding,
      body: jsonBody,
    );
  }





}