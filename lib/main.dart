import 'dart:io';

import 'package:apimarvel/service/http_provider.dart';
import 'package:flutter/material.dart';

import 'home/my_app.dart';

void main() {
  runApp(MyApp());
  var http = HttpProvider();

  http.getApi();
}
