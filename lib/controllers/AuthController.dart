import 'package:dean/services/remot_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoadingCreateUser = false.obs;
  var sayHello = "Hello".obs;
  createUser(userInfo) async {
    // print(userInfo[0]);
    isLoadingCreateUser.value = true;
    var response = await RemoteServices.CreateUser(userInfo);

    isLoadingCreateUser.value = false;
    return response;
  }
}
