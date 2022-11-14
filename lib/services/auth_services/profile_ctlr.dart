
import 'dart:convert';

import 'package:docs_and_nurs/services/auth_services/profile_repo.dart';
import 'package:docs_and_nurs/services/models/get_profile_model.dart';
import 'package:get/get.dart';
import '../models/response_model.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepo profileRepo;

  ProfileController({required this.profileRepo});
  late Data _data;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Data get data => _data;

  Future<ResponseModel> getUserProfile() async {
    Response response = await profileRepo.getUserProfile();
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      _data = Data.fromJson(response.body['data']);
      _isLoading = true;
      responseModel = ResponseModel(false, 'successful');
    } else {
      responseModel = ResponseModel(true, response.statusText!);
    }
    update();
    return responseModel;
  }

  Future<ResponseModel> upComingAppointment() async {
    Response response = await profileRepo.upComingAppointment();
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      _data = Data.fromJson(response.body['data']);
      _isLoading = true;
      responseModel = ResponseModel(false, 'successful');
    } else {
      responseModel = ResponseModel(true, response.statusText!);
    }
    update();
    return responseModel;
  }
}