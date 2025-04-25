import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double horizontalPadding = screenWidth < 600
            ? 16
            : screenWidth < 900
            ? 48
            : 100;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
          decoration: const BoxDecoration(color: Color(0xFF191919)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: screenWidth < 600 ? 20 : 23,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "With extensive experience in Flutter development, I specialize in building responsive, high-performance mobile and web applications. I have a strong foundation in front-end and back-end technologies, ensuring seamless integration, optimized user experiences, and robust app performance. Passionate about delivering scalable and innovative solutions, I bring a strong problem-solving approach to every project I work on.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFFC5C5C5),
                  fontSize: screenWidth < 600 ? 13 : 14,
                ),
              ),
              const SizedBox(height: 30),

              // Email Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.email_outlined, color: Colors.white),
                  const SizedBox(width: 16),
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'sahildeveloper15@gmail.com',
                        );
                        if (await canLaunchUrl(emailUri)) {
                          await launchUrl(emailUri);
                        } else {
                          throw 'Could not launch email client';
                        }
                      },
                      child: Text(
                        "sahildeveloper15@gmail.com",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFC5C5C5),
                          fontSize: screenWidth < 600 ? 13 : 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Phone Row
              Row(
                children: [
                  const Icon(Icons.call, color: Colors.white),
                  const SizedBox(width: 16),
                  Text(
                    "+91 7024839871",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFC5C5C5),
                      fontSize: screenWidth < 600 ? 13 : 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}
