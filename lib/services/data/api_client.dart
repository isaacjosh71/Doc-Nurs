
import 'package:get/get.dart';
import 'package:docs_and_nurs/services/data/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService{

  late String token;
  late Map<String, String> _mainHeaders;
  late SharedPreferences sharedPreferences;
  ApiClient({required this.sharedPreferences}){
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(APPURLS.TOKEN) ?? 'access_token';
    _mainHeaders={
      'Content-type':'application/json',
      'Authorization': 'Bearer $token',
      'Accept': "application/json"
    };
  }

  void updateHeader(String token){
    _mainHeaders={
      'Accept': 'application/json',
      'Content-type':'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async{
    try{
      Response response = await get(uri,
          headers: headers??_mainHeaders);
      return response;
    }catch(e){
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }

  Future<Response> postData (String uri, dynamic body) async {
    print(body.toString());
    try{
      Response response = await post(uri, body, headers: _mainHeaders);
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
      return Response(
          statusCode: 1,
          statusText: e.toString());
    }
  }
  // getHeaders() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Object? accessToken = prefs.setString(APPURLS.TOKEN, 'token');
  //   print('token $accessToken');
  //   return <String, String>{
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $accessToken',
  //     'Accept': 'application/json',
  //     // 'Charset': 'utf-8',
  //   };
  // }
}