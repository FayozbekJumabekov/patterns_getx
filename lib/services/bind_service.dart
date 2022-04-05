import 'package:get/get.dart';
import 'package:patterns_getx/controllers/main_controller.dart';
import 'package:patterns_getx/controllers/payment_controller.dart';
import 'package:patterns_getx/controllers/setting_controller.dart';

class ControllersBinders implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<PaymentController>(PaymentController());
    Get.put<SettingController>(SettingController());

  }
}
