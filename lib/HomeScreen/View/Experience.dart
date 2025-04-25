import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ShaderMask(
            shaderCallback:
                (bounds) =>
                const LinearGradient(
                  colors: [Colors.pink, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(
                  Rect.fromLTWH(
                      0, 0, bounds.width, bounds.height),
                ),
            child: Text(
              'Experience'.toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors
                    .white, // Required for ShaderMask to work
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double imageSize = maxWidth < 400 ? 30 : 40;
        double titleFontSize = maxWidth < 400 ? 16 : 21;
        double descriptionFontSize = maxWidth < 400 ? 12 : 14;
        double durationFontSize = maxWidth < 400 ? 12 : 14;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: maxWidth < 600 ? 12 : 24,
            vertical: 16,
          ),

          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: imageSize,
                          width: imageSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: titleFontSize,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    duration,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                      fontSize: durationFontSize,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                  fontSize: descriptionFontSize,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
