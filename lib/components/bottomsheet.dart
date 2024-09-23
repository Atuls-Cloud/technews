import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technews/components/components.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, description, imageurl, url) {
  showBottomSheet(
      backgroundColor: AppColors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
            title: title,
            description: description,
            url: url,
            imageurl: imageurl);
      });
}

_launchMyUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, url, imageurl;
  const MyBottomSheetLayout(
      {super.key,
      required this.title,
      required this.description,
      required this.url,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetImage(title: title, imageurl: imageurl),
          Container(
            padding: const EdgeInsets.all(10),
            child:
                ModifiedText(text: description, size: 16, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: 'Read Full Article',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchMyUrl(url);
                  },
                style: GoogleFonts.lato(color: Colors.blue.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
