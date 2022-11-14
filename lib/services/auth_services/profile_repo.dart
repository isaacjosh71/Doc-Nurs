
import 'package:docs_and_nurs/services/data/api_client.dart';
import 'package:get/get.dart';

class ProfileRepo{
 final ApiClient apiClient;

 ProfileRepo({required this.apiClient});

 Future<Response> getUserProfile() async{
  return await apiClient.getData('https://docs.shop4me.online/api/v1/patient/profile');
 }

 Future<Response> upComingAppointment() async{
  return await apiClient.getData('https://docs.shop4me.online/api/v1/patient/appointment/upcoming-appointments');
 }
}