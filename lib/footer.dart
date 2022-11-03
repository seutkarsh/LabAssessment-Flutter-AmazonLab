import 'package:amazon_lab/icon.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconFooter(
              image: "assets/images/linkedin.png",
              link: "https://www.linkedin.com/in/seutkarsh"),
          IconFooter(
              image: "assets/images/instagram.png",
              link: "https://www.instagram.com/seutkarsh"),
          IconFooter(
              image: "assets/images/github.png",
              link: "https://www.github.com/seutkarsh")
        ],
      ),
    );
  }
}
