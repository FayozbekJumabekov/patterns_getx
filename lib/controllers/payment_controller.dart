import 'package:get/get.dart';
import 'package:patterns_getx/model/post_model.dart';

import '../services/http_service.dart';

class PaymentController extends GetxController {
  bool isLoading = false;
  List<Post> items = [];

  void apiPostList() async {
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    update();
  }

  void apiPostDelete(Post post) async {
    isLoading = true;
    update();
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    }
    isLoading = false;
    update();
  }
}
