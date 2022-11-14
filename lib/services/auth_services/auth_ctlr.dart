
import 'dart:convert';

import 'package:docs_and_nurs/services/auth_services/auth_repo.dart';
import 'package:docs_and_nurs/services/models/logInEmail_model.dart';
import 'package:docs_and_nurs/services/models/loginphone_model.dart';
import 'package:docs_and_nurs/services/models/response_model.dart';
import 'package:docs_and_nurs/services/models/sign_up_body_model.dart';
import 'package:docs_and_nurs/services/physician%20model/phys_signup_body.dart';
import 'package:docs_and_nurs/services/physician%20model/signUPOtp_model.dart';
import 'package:get/get.dart';
import '../models/otp_model.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading  => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201){
      responseModel = ResponseModel(false, response.body.toString());
    }else{responseModel = ResponseModel(true, response.statusText!);}
    update();
    _isLoading = false;
    return responseModel;
  }

  Future<ResponseModel> physicianRegistration(SignUpPhysBody signUpPhysBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.physicianRegistration(signUpPhysBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201){
      responseModel = ResponseModel(false, response.body.toString());
    }else{responseModel = ResponseModel(true, response.statusText!);}
    update();
    _isLoading = false;
    return responseModel;
  }

  Future<ResponseModel> verifyCode(OtpBody otpBody) async {
    print("getting token");
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.verifyCode(otpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201){
      // authRepo.saveUserToken(response.body.toString());
      authRepo.saveUserToken(response.body['data']['access_token']);
      print('My token is${response.body['data']['access_token'].toString()}');
      responseModel = ResponseModel(false, response.body.toString());
    }else{responseModel = ResponseModel(true, response.statusText!);}
    update();
    _isLoading = false;
    return responseModel;
  }

  Future<ResponseModel> physicianVerifyCode(OtpPhysBody otpPhysBody) async {
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.physicianVerifyCode(otpPhysBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201){
      authRepo.saveUserToken(response.body['data']['access_token']);
      print('My token is${response.body['data']['access_token'].toString()}');
      responseModel = ResponseModel(false, response.body.toString());
    }else{responseModel = ResponseModel(true, response.statusText!);}
    update();
    _isLoading = false;
    return responseModel;
  }

  Future<ResponseModel> loginEmail(EmailBody emailBody) async {
    print("getting token");
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.loginEmail(emailBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201){
      authRepo.saveUserToken(response.body['data']['access_token']);
      print('My token is${response.body['data']['access_token'].toString()}');
      responseModel = ResponseModel(false, response.body.toString());
    }else{responseModel = ResponseModel(true, response.statusText!);}
    update();
    _isLoading = false;
    return responseModel;
  }

  Future<ResponseModel> loginPhone(PhoneBody phoneBody) async {
    print("getting token");
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.loginPhone(phoneBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201){
      authRepo.saveUserToken(response.body['data']['access_token']);
      print('My token is${response.body['data']['access_token'].toString()}');
      responseModel = ResponseModel(false, response.body.toString());
    }else{responseModel = ResponseModel(true, response.statusText!);}
    update();
    _isLoading = false;
    return responseModel;
  }

  void savePhoneNumberAndPassword(String number, String password) {
    authRepo.savePhoneNumberAndPassword(number, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  bool clearedSharedData(){
    return authRepo.clearedSharedData();
  }
}