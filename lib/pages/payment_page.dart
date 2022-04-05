import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/main_controller.dart';
import 'package:patterns_getx/views/item_payment_page.dart';

import '../controllers/payment_controller.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
    Get.find<PaymentController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX"),
        ),
        body: GetBuilder<PaymentController>(
            init: PaymentController(),
            builder: (_controller) {
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: _controller.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfPaymentPost(_controller,
                          _controller.items[index]);
                    },
                  ),
                  _controller.isLoading
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
