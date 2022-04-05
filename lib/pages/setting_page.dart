import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/controllers/payment_controller.dart';
import 'package:patterns_getx/controllers/setting_controller.dart';
import 'package:patterns_getx/views/item_setting_post.dart';
import '../views/item_home_post.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    Get.find<SettingController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX"),
        ),
        body: GetX<SettingController>(
            init: SettingController(),
            builder: (_controller) {
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: _controller.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfSettingPost(
                          _controller, _controller.items[index]);
                    },
                  ),
                  _controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox.shrink(),
                ],
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
