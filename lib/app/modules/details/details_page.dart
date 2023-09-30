import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/modules/details/details_controller.dart';
class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('DetailsPage'),
      ),
      body: Container(
        color: Colors.cyan,
      ),
    );
  }
}
