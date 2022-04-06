import 'package:get/get.dart';
import 'package:patterns_getx/controllers/detail_controller.dart';
import 'package:patterns_getx/controllers/main_controller.dart';
import '../controllers/payment_controller.dart';
import '../controllers/setting_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);
  }
}
