import 'package:flutter/material.dart';
import '../../core/constants.dart';

class CardTileWidget extends StatelessWidget {
  final String imageUrl;
  const CardTileWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
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
    );
  }
}
