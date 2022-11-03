import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IconFooter extends StatelessWidget {
  final String image;
  final String link;
  IconFooter({super.key, required this.image, required this.link});

  @override
  Widget build(BuildContext context) {
    final Uri _linkedin = Uri.parse(link);

    Future<void> _launchLinkedin() async {
      if (!await launchUrl(_linkedin)) {
        throw 'Could not launch www.linkedin.com/in/seutkarsh';
      }
    }

    return IconButton(
      icon: Image.asset(image),
      iconSize: 50,
      onPressed: _launchLinkedin,
    );
  }
}
