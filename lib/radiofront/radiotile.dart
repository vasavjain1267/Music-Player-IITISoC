import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:harmonix/radiofront/radio.dart';

class CustomRadioListTile extends StatelessWidget {
  final RadioModel radio;
  final bool isPlaying;
  final Function() onTap;
  const CustomRadioListTile(
      {super.key,
      required this.radio,
      required this.isPlaying,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 50,
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            radio.image!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(radio.votes ?? "-"),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(radio.title ?? "No title Available"),
                Text(
                  radio.subtitle ?? "No information available",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 7,
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.more_horiz_outlined),
    );
  }
}
