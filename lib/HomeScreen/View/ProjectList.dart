import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectCard(
            image: "assets/icon/dive.webp",
            title: "Dive Money",
            description:"A simple savings app for Gen Z in India. Start saving with as little as ₹100 and earn up to 10.5% interest—no complicated terms, just easy savings.",
            techs: ["Flutter", "Firebase", "Push Notification", "Material"],
            url: "https://play.google.com/store/apps/details?id=money.dive.app&pcampaignid=web_share",
          ),
          SizedBox(width: 40),
          ProjectCard(
            image: "assets/icon/farm.webp",
            title: "FarmEasy.ai",
            description:
            "FarmEasy connects farmers and landowners, offering expert advice, essential services, and modern farming techniques to boost yield and efficiency.",
            techs: ["Flutter", "Firebase", "Push Notification", "Material"],
            url: "https://play.google.com/store/apps/details?id=ai.farmeasy.codenicely&pcampaignid=web_share",

          ),
          SizedBox(width: 40),
          ProjectCard(
            image: "assets/icon/walnut.webp",
            title: "Walnut",
            description:
            "Walnut Health Club is one of a kind social networking platform for health and well-being, exclusively formed to establish a health ecosystem right from the roots of Generation Z & Alpha.",
            techs: ["Flutter", "Firebase", "Push Notification"],
            url: "https://play.google.com/store/apps/details?id=com.walnut.walnut_app&pcampaignid=web_share",

          ),
          SizedBox(width: 40),
          ProjectCard(
            image: "assets/icon/bogo.webp",
            title: "Bogo",
            description:
            "Get unlimited buy 1 get 1 offer, deals, and discounts on BOGO app. BOGO- Buy 1 Get 1 Offer app helps you save more while enjoying your favourite products and services.",
            techs: ["Flutter", "Firebase", "Push Notification"],
            url: "https://play.google.com/store/apps/details?id=com.bogo.codenicely.android.bogo.customer&pcampaignid=web_share",

          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final List<String> techs;
  final String url; // <-- Add this

  const ProjectCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.techs,
    required this.url, // <-- And this
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF2A2A2A),
        border: Border.all(color: Color(0xFF2A2A2A), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color(0xFF161513),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Image.asset(image),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final Uri uri = Uri.parse(url);
                        print(uri);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Transform.rotate(
                        angle: -40 * 3.1416 / 180,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: techs
                        .map((tech) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF5E6266),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ))
                        .toList(),
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
