import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutItems extends StatelessWidget {
  const AboutItems({super.key});

  @override
  Widget build(BuildContext context) {
    void launchEmail(String email) async {
      final uri = Uri.parse('mailto:$email');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }

    void launchPhone(String phone) async {
      final uri = Uri.parse('tel:$phone');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
            onPressed: () => launchEmail('autizamns@gmail.com'),
            icon: FaIcon(
              FontAwesomeIcons.envelope,
              color: AppColors.fadedBlack,
              size: 25.r,
            ),
            label: Text(
              'autizamns@gmail.com',
              textAlign: TextAlign.justify,
              style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.bold),
            )),
        TextButton.icon(
            onPressed: () => launchPhone('+381 60 45 03 765'),
            icon: FaIcon(
              FontAwesomeIcons.headset,
              color: AppColors.fadedBlack,
              size: 25.r,
            ),
            label: Text(
              'Zorana Bijelović\n+381 60 45 03 765 ',
              textAlign: TextAlign.justify,
              style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.bold),
            )),
        TextButton.icon(
            onPressed: () => launchPhone('+381 60 402 76 925'),
            icon: FaIcon(
              FontAwesomeIcons.headset,
              color: AppColors.fadedBlack,
              size: 25.r,
            ),
            label: Text(
              'Radojka Gajanović\n+381 60 402 76 925',
              textAlign: TextAlign.justify,
              style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.bold),
            )),
        TextButton.icon(
            onPressed: null,
            icon: FaIcon(
              FontAwesomeIcons.buildingColumns,
              color: AppColors.fadedBlack,
              size: 25.r,
            ),
            label: Text(
              'Otp banka: 325-9500600024356-23',
              textAlign: TextAlign.justify,
              style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
