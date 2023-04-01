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
      final uri = Uri(scheme: 'tel', path: phone);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }

    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.only(top: 40.r),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    width: 250.w,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => launchEmail('autizamns@gmail.com'),
                        icon: FaIcon(
                          FontAwesomeIcons.envelope,
                          color: AppColors.fadedBlack,
                          size: 25.r,
                        ),
                        label: Text(
                          'autizamns@gmail.com',
                          style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.w900),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith((states) => AppColors.lightGrean),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    width: 250.w,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => launchPhone('+381604503765'),
                        icon: FaIcon(
                          FontAwesomeIcons.headset,
                          color: AppColors.fadedBlack,
                          size: 25.r,
                        ),
                        label: Text(
                          'Zorana Bijelović\n+381 60 45 03 765 ',
                          style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.w900),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith((states) => AppColors.lightGrean),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    width: 250.w,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => launchPhone('+3816040276925'),
                        icon: FaIcon(
                          FontAwesomeIcons.headset,
                          color: AppColors.fadedBlack,
                          size: 25.r,
                        ),
                        label: Text(
                          'Radojka Gajanović\n+381 60 402 76 925',
                          style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.w900),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith((states) => AppColors.lightGrean),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    width: 250.w,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: null,
                        icon: FaIcon(
                          FontAwesomeIcons.buildingColumns,
                          color: AppColors.fadedBlack,
                          size: 25.r,
                        ),
                        label: Text(
                          'Otp banka: 325-9500600024356-23',
                          style: TextStyle(color: AppColors.darkGrean, fontSize: 13.sp, fontWeight: FontWeight.w900),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith((states) => AppColors.lightGrean),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
