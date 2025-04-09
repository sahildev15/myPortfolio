import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
  var terminalLogs = <String>[].obs;
 final inputController = TextEditingController();
  void processCommand(String input) {
    terminalLogs.add('> $input');

    switch (input.trim().toLowerCase()) {
      case 'about':
        terminalLogs.add("I'm Sahil, a Flutter dev with 3+ years of experience.");
        break;
      case 'skills':
        terminalLogs.add("Flutter, Dart, Firebase, GetX, REST APIs, Flutter Web.");
        break;
      case 'projects':
        terminalLogs.add("1. E-commerce App\n2. Pharmacy Inventory\n3. Portfolio Website");
        break;
      case 'clear':
        terminalLogs.clear();
        break;
      default:
        terminalLogs.add("Unknown command: $input");
    }
  }
}