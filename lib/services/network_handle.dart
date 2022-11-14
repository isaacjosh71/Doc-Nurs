import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'models/response_model.dart';

class NetworkHandle {
  String baseUrl = 'https://docs.shop4me.online/api/v1';
  var log = Logger();

  Future get(String path) async {
    // String? token = await storage.read(key: 'token');
    final String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    var response = await http.get(uri,
    headers: await getHeaders(),
    // {
    //   'Authorization': 'Bearer $token',
    //   'Accept': 'application/json',
    // }
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String path, Map<dynamic, dynamic> body) async {
    // String? token = await storage.read(key: 'token');
    log.d(body);
    final String url = baseUrl + path;
    Uri uri = Uri.parse(url);
    var response = await http.post(uri,
        headers: await getHeaders(),
        // {
        //   'Accept': 'application/json',
        //   'Content-type':'application/json',
        //   'Authorization': 'Bearer $token'
        // },
        body: json.encode(body)).timeout(const Duration(seconds: 30));
    return response;
  }

  getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? accessToken = prefs.get('access_token');
    print('access_token $accessToken');
    return <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
      // 'Charset': 'utf-8',
    };
  }
}