import 'package:dean/models/Payment.dart';
import 'package:dean/screens/MainScreens/profile/PaymentMathodScreen.dart';
import 'package:dean/services/payment_remote_services.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var paymentList = [].obs;
  var isLoading = false.obs;
  var isLoadingAdd = false.obs;
  getCard() async {
    isLoading.value = true;
    var response = await PaymentRemoteServices.getCard();
    if (response['status']) {
      print("LOG::: printing card lists");
      print(response['card']);
      paymentList.clear();
      for (int i = 0; i < response['card'].length; ++i) {
        paymentList.add(response['card'][i]);
      }
      isLoading.value = false;
      return paymentList;
    } else {
      showToastMessage(response["message"]);
    }
    isLoading.value = false;
    return null;
  }

  addCard(data) async {
    isLoadingAdd.value = true;
    var response = await PaymentRemoteServices.addCard(data);
    if (response['status']) {
      print("LOG::: printing card lists");
      print(response['card']);

      var tempCardList = [];
      for (int i = 0; i < response['card'].length; ++i) {
        tempCardList.add(response['card'][i]);
      }

      paymentList.value = tempCardList;

      showToastMessage("Card added successfully!");
      isLoadingAdd.value = false;
      return paymentList;
    } else {
      showToastMessage(response["message"]);
    }
    isLoadingAdd.value = false;
    return null;
  }

  deleteCard(id) async {
    var response = await PaymentRemoteServices.deleteCard(id);
    if (response['status']) {
      showToastMessage("Card Deleted Successfully!");
    } else {
      showToastMessage("Something went wrong!");
    }
  }
}
