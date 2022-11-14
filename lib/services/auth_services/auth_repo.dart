
import 'package:docs_and_nurs/services/data/app_urls.dart';
import 'package:docs_and_nurs/services/models/otp_model.dart';
import 'package:docs_and_nurs/services/models/sign_up_body_model.dart';
import 'package:docs_and_nurs/services/physician%20model/phys_signup_body.dart';
import 'package:docs_and_nurs/services/physician%20model/signUPOtp_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api_client.dart';
import '../models/logInEmail_model.dart';
import '../models/loginphone_model.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient, required this.sharedPreferences
  });

  Future<Response>registration(SignUpBody signUpBody) async {
    return await apiClient.postData('https://docs.shop4me.online/api/v1/patient/signup', signUpBody.toJson());
  }

  Future<Response>physicianRegistration(SignUpPhysBody signUpPhysBody) async {
    return await apiClient.postData('https://docs.shop4me.online/api/v1/physician/signup', signUpPhysBody.toJson());
  }

  Future<Response>verifyCode(OtpBody otpBody) async {
    return await apiClient.postData('https://docs.shop4me.online/api/v1/patient/verify/otp', otpBody.toJson());
  }

  Future<Response>physicianVerifyCode(OtpPhysBody otpPhysBody) async {
    return await apiClient.postData('https://docs.shop4me.online/api/v1/physician/verify/otp', otpPhysBody.toJson());
  }

  Future<Response>loginEmail(EmailBody emailBody) async {
    return await apiClient.postData('https://docs.shop4me.online/api/v1/patient/login/email', emailBody.toJson());
  }

  Future<Response>loginPhone(PhoneBody phoneBody) async {
    return await apiClient.postData('https://docs.shop4me.online/api/v1/patient/login/phone-number', phoneBody.toJson());
  }

  getUserToken() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(APPURLS.TOKEN)??"None";
    print('getUserToken: $token');
  }

  bool userLoggedIn (){
    return sharedPreferences.containsKey(APPURLS.TOKEN);
  }

  saveUserToken(dynamic token) async{
  apiClient.token = token;
  apiClient.updateHeader(token);
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(APPURLS.TOKEN, token);
  print('save user: $token');
}

 Future<void> savePhoneNumberAndPassword(String number, String password)async {
    try{
      await sharedPreferences.setString(APPURLS.PHONE, number);
      await sharedPreferences.setString(APPURLS.PASSWORD, password);
    }catch(e){
      throw e;
    }
 }

 bool clearedSharedData (){
    sharedPreferences.remove(APPURLS.TOKEN);
    sharedPreferences.remove(APPURLS.PASSWORD);
    sharedPreferences.remove(APPURLS.PHONE);
    apiClient.token="";
    apiClient.updateHeader("");
    return true;
 }
}