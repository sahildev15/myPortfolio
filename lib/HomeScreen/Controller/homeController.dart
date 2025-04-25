import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{
  final scrollController = ScrollController();

  final projectKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();


  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
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
  RxInt hoveredIndex = (-1).obs;

  RxList <String> icons = <String>[
    "assets/icon/linkdin.svg",
    "assets/icon/github.svg",
    "assets/icon/instagram.svg",
  ].obs;


}