import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_portfolio/HomeScreen/Controller/homeController.dart';
import 'package:my_portfolio/Utils/Colors.dart';

import '../../Utils/Res/MouseContainer.dart';
import '../../Utils/Textstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
        
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.LIGHT_BLACK,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(controller.title.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.title[index],
                                style: AppTextStyles.FONT12FW600WHITE,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.LIGHT_BLACK,
                  ),
                ),
                Text(
                  "Hi! I’m Sahil kumar",
                  style: AppTextStyles.FONT55FW800WHITE,
                ),
                Container(
                  width: 900,
                  child: Text(
                    "Hello, I'm Ayan Gupta. Ever since I was a child, development has been my passion. I founded the Discord community Coders Evoke, catering to beginners. I am a programmer and an avid learner, passionate about fostering team growth and realizing dreams. My specialties include rapidly acquiring new skills and mastering various programming languages.",
                   maxLines: 4,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.FONT18FW300WHITE,
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.option.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return HoverOptionTile(label: controller.option[index]);
                    },
                  ),
                ),
                Center(child: Text("FIND ME IN",style: AppTextStyles.FONT20FW600LIGHT_GREY,)),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(controller.icons.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: SvgPicture.asset(
                            controller.icons[index],
                            height: 30,width: 30,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: Obx(() => ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.terminalLogs.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Text(
                      controller.terminalLogs[index],
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontFamily: 'Courier',
                        fontSize: 14,
                      ),
                    ),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.black,
                  child: TextField(
                    controller: controller.inputController,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontFamily: 'Courier',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type a command...',
                      hintStyle: TextStyle(
                        color: Colors.greenAccent.withOpacity(0.4),
                      ),
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) {
                      controller.processCommand(value);
                      controller.inputController.clear();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
