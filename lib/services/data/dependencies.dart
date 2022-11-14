
import 'package:docs_and_nurs/services/auth_services/auth_ctlr.dart';
import 'package:docs_and_nurs/services/auth_services/auth_repo.dart';
import 'package:get/get.dart';
import 'package:docs_and_nurs/services/data/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_services/profile_ctlr.dart';
import '../auth_services/profile_repo.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(()=> ApiClient(sharedPreferences: Get.find()));

  //repositories
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ProfileRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProfileController(profileRepo: Get.find()));
}