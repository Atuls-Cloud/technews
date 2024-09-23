import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technews/components/bottomsheet.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';

class NewsBox extends StatelessWidget {
  const NewsBox(
      {super.key,
      required this.url,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description});
  final String url, imageurl, title, time, description;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(20),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModifiedText(text: title, size: 16, color: AppColors.white),
                    const SizedBox(
                      height: 5,
                    ),
                    ModifiedText(
                        text: time, size: 12, color: AppColors.lightWhite),
                  ],
                )),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            color: AppColors.lightWhite,
          ),
        ),
      ],
    );
  }
}
