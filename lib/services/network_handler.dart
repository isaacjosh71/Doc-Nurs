import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import 'models/response_model.dart';

class NetworkHandler{
  String baseUrl = 'https://docs.shop4me.online/api/v1';
  var log = Logger();

  Future get(String path) async{
    final String url = baseUrl + path;
    // path = format(url);
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if(response.statusCode==200 || response.statusCode==201){
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<ResponseModel> post(String path, Map<String, String> body) async{
    log.d(body);
    final String url = baseUrl + path;
    // path = format(url);
    Uri uri = Uri.parse(url);
    var response = await http.post(uri,
        headers: {
          'Accept': 'application/json',
          'Content-type':'application/json',
        },
        body: json.encode(body));
    late ResponseModel responseModel;
    if(response.statusCode==200 || response.statusCode==201){
      responseModel = ResponseModel(false, response.body.toString());}
    else{responseModel = ResponseModel(true, response.body.trim());}
      log.i(response.body);
    return responseModel;
    }

  // String format(String url){
  //   return baseUrl+url;
  // }
}