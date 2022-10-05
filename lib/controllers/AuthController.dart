// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:dean/models/User.dart';
import 'package:dean/screens/MainScreens/HomePage.dart';
import 'package:dean/screens/MainScreens/HomeScreen.dart';
import 'package:dean/screens/MainScreens/profile/profile.dart';
import 'package:dean/screens/splashScreen/loginScreen.dart';
import 'package:dean/services/auth_remote_services.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoadingCreateUser = false.obs;
  var isLoadingLogin = false.obs;
  var isLoadingLogout = false.obs;
  var isLoading = false.obs;
  var userInfo = [].obs;

  createUser(userInfo) async {
    isLoadingCreateUser.value = true;
    var response = await AuthRemoteServices.CreateUser(userInfo);
    isLoadingCreateUser.value = false;
    return response;
  }

  login(userCredential) async {
    isLoadingCreateUser.value = true;
    var response = await AuthRemoteServices.login(userCredential);

    if (response['status']) {
      User user = User.fromJson(response['user']);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response['access']['token']);
      // {name,email,provider,mobile,address,image,gender,phoneNo,creditLimit}
      await prefs.setStringList("userInfo", [
        user.name,
        user.email,
        user.provider ?? "null",
        user.mobile ?? "null",
        user.address ?? "null",
        user.image ?? "null",
        user.gender ?? "null",
        user.phoneNo ?? "null",
        user.creditLimit ?? "null"
      ]);
      await prefs.setString(
          "token_expires_at", response['access']['expires_at']);
      print("form shared prefs..");
      isLoadingCreateUser.value = false;
      return true;
      // Get.offAll(HomePage());
    } else {
      showToastMessage(response['message']);
      isLoadingCreateUser.value = false;
      return false;
    }
  }

  logOut() async {
    isLoadingLogout.value = true;
    var response = await AuthRemoteServices.logOut();
    isLoadingLogout.value = false;
    print(response['status']);
    if (response['status']) {
      userInfo.clear();
      // Get.to(HomePage());
      Get.offAll(HomePage());
      showToastMessage(response['message']);
    } else {
      showToastMessage(response['message']);
    }
  }

  updateUser(userData) async {
    isLoading.value = true;
    var response = await AuthRemoteServices.updateUser(userData);
    isLoading.value = false;
    if (response['status']) {
      User user = User.fromJson(response['user']);
      final prefs = await SharedPreferences.getInstance();
      // await prefs.setString("token", response['access']['token']);
      // {name,email,provider,mobile,address,image,gender,phoneNo,creditLimit}
      // prefs.remove("userInfo");
      userInfo.clear();
      await prefs.setStringList("userInfo", [
        user.name,
        user.email,
        user.provider ?? "null",
        user.mobile ?? "null",
        user.address ?? "null",
        user.image ?? "null",
        user.gender ?? "null",
        user.phoneNo ?? "null",
        user.creditLimit ?? "null"
      ]);

      showToastMessage(response['message']);
      Get.offAll(HomePage());
    } else {
      showToastMessage(response['message']);
    }
  }

  sendOtp(email) async {
    isLoading.value = true;
    var response = await AuthRemoteServices.sendOtp(email);
    isLoading.value = false;
    if (response['status']) {
      // print(response['otp']);
      // print("OTP send successfully!");
      Map data = {
        "email": email,
        "otp": response['otp'],
      };
      return data;
    } else {
      showToastMessage("Something went wrong! try again");
      return null;
    }
  }

  verifyOtp(email, otp) async {
    isLoading.value = true;
    var response = await AuthRemoteServices.verifyOtp(email, otp);
    isLoading.value = false;
    if (response['status']) {
      // print();
      // print("OTP matched");
      Map data = {
        "token": response['token'],
      };
      showToastMessage("OTP verified!");
      return data;
    } else {
      showToastMessage(response['message']);
      return null;
    }
  }

  changePassword(token, password, password_confirmation) async {
    isLoading.value = true;
    var response = await AuthRemoteServices.changePassword(
        token, password, password_confirmation);
    isLoading.value = false;
    showToastMessage(response['message']);
    Get.offAll(LoginScreen());
  }
}
