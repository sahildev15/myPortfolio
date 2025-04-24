import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExperienceCard(
          imagePath: "assets/icon/cn.jpeg",
          title: "Senior Flutter Developer",
          duration: "Dec 2023 - Present",
          description:
          "I specialize in Flutter web development, responsive web design, cross-platform app development, and CI/CD. I also work with iOS development, app deployment on the App Store and Google Play, Firebase push notifications, and Crashlytics.",
        ),
        SizedBox(height: 20),
        ExperienceCard(
          imagePath: "assets/icon/dive.webp",
          title: "Flutter Developer (Freelancer)",
          duration: "May 2024 - Sept 2024",
          description:
          "I have worked on the Android and iOS app development for Dive Money, focusing on creating seamless and user-friendly mobile experiences. My role involved building and deploying the app on both platforms, ensuring a high-quality user experience.",
        ),
        SizedBox(height: 20),
        ExperienceCard(
          imagePath: "assets/icon/ved.jpeg",
          title: "Flutter Developer",
          duration: "Mar 2023 - Jan 2024",
          description:"During my time at Venturing Digitally, I gained hands-on experience in cross-platform development, responsive web design, CI/CD, app deployment on the App Store and Google Play, push notifications, Crashlytics, material design, cloud integration, Google Analytics, database management, and version control with Git."
        ),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String description;

  const ExperienceCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
              Text(
                duration,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
