import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_view_controller.dart';

class NewsViewPage extends GetView<NewsViewController> {
  const NewsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsViewPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewsViewPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
