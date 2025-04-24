import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 300),
      decoration: BoxDecoration(color: Color(0xFF191919)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text(
            "Contact",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 23,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "With extensive experience in Flutter development, I specialize in building responsive, high-performance mobile and web applications. I have a strong foundation in front-end and back-end technologies, ensuring seamless integration, optimized user experiences, and robust app performance. Passionate about delivering scalable and innovative solutions, I bring a strong problem-solving approach to every project I work on.",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w300,
              color: Color(0xFFC5C5C5),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.email_outlined, color: Colors.white),
            SizedBox(width: 20),
            GestureDetector(
              onTap:() async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'sahildeveloper15@gmail.com',
                );
                if (await canLaunch(emailUri.toString())) {
                  await launch(emailUri.toString());
                } else {
                  throw 'Could not launch email client';
                }
              },
              child: Text(
                "sahildeveloper15@gmail.com",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFC5C5C5),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.call, color: Colors.white),
              SizedBox(width: 20,),

              Text("+91 7024839871", style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                color: Color(0xFFC5C5C5),
                fontSize: 14,
              ),),
            ],
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}
