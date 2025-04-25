import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
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
            'Projects'.toUpperCase(),
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors
                  .white, // Required for ShaderMask to work
            ),
          ),
        ),
        SizedBox(height: 30,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(width: 16),
              ProjectCard(
                image: "assets/icon/dive.webp",
                title: "Dive Money",
                description: "A simple savings app for Gen Z in India. Start saving with as little as ₹100 and earn up to 10.5% interest—no complicated terms, just easy savings.",
                techs: ["Flutter", "Firebase", "Push Notification", "Material"],
                url: "https://play.google.com/store/apps/details?id=money.dive.app&pcampaignid=web_share",
              ),
              SizedBox(width: 24),
              ProjectCard(
                image: "assets/icon/farm.webp",
                title: "FarmEasy.ai",
                description: "FarmEasy connects farmers and landowners, offering expert advice, essential services, and modern farming techniques to boost yield and efficiency.",
                techs: ["Flutter", "Firebase", "Push Notification", "Material"],
                url: "https://play.google.com/store/apps/details?id=ai.farmeasy.codenicely&pcampaignid=web_share",
              ),
              SizedBox(width: 24),
              ProjectCard(
                image: "assets/icon/walnut.webp",
                title: "Walnut",
                description: "Walnut Health Club is one of a kind social networking platform for health and well-being, exclusively formed to establish a health ecosystem right from the roots of Generation Z & Alpha.",
                techs: ["Flutter", "Firebase", "Push Notification"],
                url: "https://play.google.com/store/apps/details?id=com.walnut.walnut_app&pcampaignid=web_share",
              ),
              SizedBox(width: 24),
              ProjectCard(
                image: "assets/icon/bogo.webp",
                title: "Bogo",
                description: "Get unlimited buy 1 get 1 offer, deals, and discounts on BOGO app. BOGO- Buy 1 Get 1 Offer app helps you save more while enjoying your favourite products and services.",
                techs: ["Flutter", "Firebase", "Push Notification"],
                url: "https://play.google.com/store/apps/details?id=com.bogo.codenicely.android.bogo.customer&pcampaignid=web_share",
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final List<String> techs;
  final String url;

  const ProjectCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.techs,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF2A2A2A),
        border: Border.all(color: const Color(0xFF2A2A2A), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top image
          Container(
            height: 140,
            width: double.infinity,

            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              color: Color(0xFF161513),
            ),
            child: Image.asset(image),
          ),
          // Content section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Transform.rotate(
                        angle: -40 * 3.1416 / 180,
                        child: const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
                      ),
                      onPressed: () async {
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                  ],
                ),

                // Description
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: techs.map((tech) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF5E6266),
                          ),
                          child: Text(
                            tech,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Colors.white,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

