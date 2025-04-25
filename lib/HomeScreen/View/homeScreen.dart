import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:my_portfolio/HomeScreen/Controller/homeController.dart';
import 'package:my_portfolio/Utils/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utils/Res/MouseContainer.dart';
import '../../Utils/Textstyles.dart';
import 'Contact.dart';
import 'Experience.dart';
import 'ProjectList.dart';
import 'dart:html' as html;
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.LIGHT_BLACK,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double screenWidth = constraints.maxWidth;
                    double horizontalSpacing = screenWidth < 500 ? 30 : 50;
                    return Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: horizontalSpacing,
                        runSpacing: 16,
                        children: List.generate(controller.title.length, (index) {
                          final label = controller.title[index]; // ✅ fix here

                          return GestureDetector(
                            onTap: () {
                              switch (label.toLowerCase()) {
                                case "projects":
                                  controller.scrollTo(controller.projectKey);
                                  break;
                                case "experience":
                                  controller.scrollTo(controller.experienceKey);
                                  break;
                                case "contact":
                                  controller.scrollTo(controller.contactKey);
                                  break;
                                case "home":
                                default:
                                  controller.scrollToTop();
                                  break;
                              }
                            },
                            child: Text(
                              label,
                              style: AppTextStyles.FONT12FW600WHITE(context),
                            ),
                          );
                        }),

                      ),
                    );
                  },
                ),
              ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.zero,
                child: LayoutBuilder(
                builder: (context, constraints) {
                  double horizontalMargin;

                  if (constraints.maxWidth < 600) {
                    horizontalMargin = 20;
                  } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 1024) {
                    horizontalMargin = 40;
                  } else {
                    horizontalMargin = 200;
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        SizedBox(height: 20,),
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.LIGHT_BLACK,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icon/sahil.png"))
                          ),
                        ),
                        SizedBox(height: 30,),

                        Text(
                          "Hi! I’m Sahil kumar",
                          style: AppTextStyles.FONT55FW800WHITE(context),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30,),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                          width: 900,
                          child: Text(
                            "Hi, I'm Sahil — a Senior Flutter Developer with a deep passion for crafting beautiful, high-performance apps. From transforming ideas into seamless mobile experiences to leading efficient, cross-platform development, I thrive on building impactful digital products. I’m constantly evolving with new technologies, and I believe in not just writing code, but creating value. Let’s build the future, one app at a time."
                            , maxLines: 10,
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
                              return GestureDetector(
                                onTap: (){
                                  if(controller.option[index] =="Hire Me"){
                                    controller.scrollTo(controller.contactKey);
                                  } else{
                                    const cvUrl = 'assets/icon/sahilresume.pdf';
                                    final anchor = html.AnchorElement(href: cvUrl)
                                      ..setAttribute("download", "Sahil_Resume.pdf")
                                      ..click();
                                  }
                                },
                                child: HoverOptionTile(
                                    label: controller.option[index]),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 50,),
                        Center(
                          child: Text(
                            "FIND ME IN",
                            style: AppTextStyles.FONT20FW600LIGHT_GREY(context),
                          ),
                        ),
                    SizedBox(height: 30,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(controller.icons.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: MouseRegion(
                              onEnter: (_) => controller.hoveredIndex.value = index,
                              onExit: (_) => controller.hoveredIndex.value = -1,
                              child: GestureDetector(
                                onTap: () {
                                  final urls = [
                                    "https://www.linkedin.com/in/sahil-kumar-78658329a/",
                                    "https://github.com/sahildev15",
                                    "https://www.instagram.com/shrisahil__?igsh=dWtqeHJleTVzaTgw",
                                  ];
                                  final url = urls[index];
                                  launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                                },
                                child: Obx(() => AnimatedScale(
                                  duration: Duration(milliseconds: 200),
                                  scale: controller.hoveredIndex.value == index ? 1.2 : 1.0,
                                  child: SvgPicture.asset(
                                    controller.icons[index],
                                    height: 30,
                                    width: 30,
                                  ),
                                )),
                              ),
                            ),
                          );
                        })),
                        SizedBox(height: 50,),
                        ProjectList(key: controller.projectKey,),
                        SizedBox(height: 50,),

                        Experience(key: controller.experienceKey,),
                        SizedBox(height: 50,),
                        ContactPage(key: controller.contactKey,)
                      ],
                    ),
                  );
                }))
            ],
          ),
        ),
      ),
    );
  }
}
