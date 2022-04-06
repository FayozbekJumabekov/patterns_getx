import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/pages/payment_page.dart';
import 'package:patterns_getx/services/di_service.dart';

Future<void> main() async {
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: PaymentPage(),
    );
  }
}
