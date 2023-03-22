import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCardTileWidget extends StatelessWidget {
  const NumberCardTileWidget({
    super.key,
    required this.index,
    required this.imageUrl,
  });

  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: screenWidth * .5,
              ),
              Container(
                width: screenWidth * .35,
                height: screenWidth * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: kRadius,
                ),
              ),
            ],
          ),
          Positioned(
            left: 5,
            bottom: -20,
            child: BorderedText(
              strokeWidth: 10.0,
              strokeColor: kwhite,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                  fontSize: 140,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                  decoration: TextDecoration.none,
                  decorationColor: kwhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
