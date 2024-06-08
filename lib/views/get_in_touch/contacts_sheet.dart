import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInTouchContactsSheet extends StatelessWidget {
  GetInTouchContactsSheet({super.key});

  final List<ContactDetails> socials = [
    ContactDetails(
        title: 'github',
        imageLink: 'assets/images/github_logo.png',
        urllink: 'https://github.com/Satendra9984'),
    ContactDetails(
        title: 'discord',
        imageLink: 'assets/images/discord_logo.png',
        urllink: 'https://discord.gg/ccMyUYST'),
    ContactDetails(
      title: 'gmail',
      imageLink: 'assets/images/gmail_logo.png',
      urllink:
          'mailto:palsatyendra9984@gmail.com?subject=Subject%20Here&body=Body%20Here',
    ),
    ContactDetails(
        title: 'linkedin',
        imageLink: 'assets/images/linkedin_logo.png',
        urllink: 'https://www.linkedin.com/in/satendra-pal-943540209/'),
    ContactDetails(
        title: 'twitter',
        imageLink: 'assets/images/twitter_logo.png',
        urllink: 'https://twitter.com/Satyend56719269'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 12.0,
        runSpacing: 12.0,
        children: List.generate(
          socials.length,
          (index) {
            var cd = socials[index];
            return GestureDetector(
              onTap: () {
                openSociallInk(cd);
              },
              child: Image.asset(
                cd.imageLink,
                height: 24.0,
                width: 24.0,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }

  void openSociallInk(ContactDetails contactDetails) {
    Uri uri;
    if (contactDetails.title == "gmail") {
      uri = Uri(
        scheme: 'mailto',
        path: 'palsatyendra9984@gmail.com',
      );
      // uri = Uri.parse('mailto:palsatyendra9984@gmail.com');
    } else {
      uri = Uri.parse(contactDetails.urllink);
    }

    launchUrl(
      uri,
      webOnlyWindowName: "_blank",
    );
  }
}

class ContactDetails {
  final String title;
  final String imageLink;
  final String urllink;

  ContactDetails({
    required this.title,
    required this.imageLink,
    required this.urllink,
  });
}
