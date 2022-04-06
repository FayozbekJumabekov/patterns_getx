import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import '../views/utils.dart';

class DetailController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool isLoading = false;

  void checkPost(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      Post post =
          Post(title: titleController.text, body: contentController.text);
      addPost(post, context);
    } else {
      Utils.showToast('Empty field');
      return;
    }
  }

  void addPost(Post post, BuildContext context) {
    isLoading = true;
    update();
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((value) {
      getResponse(value, context);
    });
  }

  void getResponse(String? response, BuildContext context) {
    isLoading = false;
    update();
    if (response != null) {
      Utils.showToast("Successfully added!");
      Navigator.pop(context);
    } else {
      Utils.showToast("Not Added!");
      Navigator.pop(context);
    }
  }
}
