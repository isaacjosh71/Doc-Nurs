//
// import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import '../auth_services/appointment_repo.dart';
//
// class AppointmentController extends GetxController implements GetxService{
//   final AppointmentRepo appointmentRepo;
//   AppointmentController({required this.appointmentRepo});
//
//   bool _isLoading = false;
//   bool get isLoading  => _isLoading;
//
//   Future<void> registration() async {
//     _isLoading = true;
//     Response response = await authRepo.registration();
//     if (response.statusCode == 200 || response.statusCode == 201){
//       _isLoading = false;
//       update();
//     }else{}
//   }