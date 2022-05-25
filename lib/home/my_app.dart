import 'dart:io';

import 'package:apimarvel/home/my_page.dart';
import 'package:apimarvel/service/http_provider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel...',
      home: MyPage(),
    );
  }
}
