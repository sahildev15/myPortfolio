import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{
  RxList <String> title = <String>[
    "Home",
    "Projects",
    "Experience",
    "Contact"
  ].obs;
  RxList <String> option = <String>[
    "Hire Me",
    "Download CV",
  ].obs;
  RxList <String> icons = <String>[
    "assets/icon/linkdin.svg",
    "assets/icon/github.svg",
    "assets/icon/instagram.svg",
  ].obs;


}