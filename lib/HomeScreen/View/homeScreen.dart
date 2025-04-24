import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:my_portfolio/HomeScreen/Controller/homeController.dart';
import 'package:my_portfolio/Utils/Colors.dart';

import '../../Utils/Res/MouseContainer.dart';
import '../../Utils/Textstyles.dart';
import 'Contact.dart';
import 'Experience.dart';
import 'ProjectList.dart';

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
                                style: AppTextStyles.FONT12FW600WHITE(context),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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
                  style: AppTextStyles.FONT55FW800WHITE(context),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 900,
                  child: Text(
                    "Hi, I'm Sahil — a Senior Flutter Developer with a deep passion for crafting beautiful, high-performance apps. From transforming ideas into seamless mobile experiences to leading efficient, cross-platform development, I thrive on building impactful digital products. I’m constantly evolving with new technologies, and I believe in not just writing code, but creating value. Let’s build the future, one app at a time."
                    ,maxLines: 5,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.FONT18FW300WHITE(context),
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
                Center(
                  child: Text(
                    "FIND ME IN",
                    style: AppTextStyles.FONT20FW600LIGHT_GREY(context),
                  ),
                ),
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
                            height: 30,
                            width: 30,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                ShaderMask(
                  shaderCallback:
                      (bounds) => const LinearGradient(
                        colors: [Colors.pink, Colors.orange],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: Text(
                    'Projects'.toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Required for ShaderMask to work
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ProjectList(),
                SizedBox(height: 20,),
                ShaderMask(
                  shaderCallback:
                      (bounds) => const LinearGradient(
                    colors: [Colors.pink, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: Text(
                    'Experience'.toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Required for ShaderMask to work
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Experience(),
                ContactPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
