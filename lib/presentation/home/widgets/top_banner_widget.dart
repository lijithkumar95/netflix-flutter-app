import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/custom_icon_widge.dart';

class TopBannerWidget extends StatelessWidget {
  const TopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: screenWidth * 1.53,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(mainBanner),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.transparent.withOpacity(0),
                  Colors.black.withOpacity(1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [.1, .5, 1],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomIconWidget(
                  icon: Icons.add,
                  title: "My LIst",
                ),
                _playButton(),
                const CustomIconWidget(
                  icon: Icons.info_outlined,
                  title: "info",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kwhite),
      ),
      icon: const Padding(
        padding: EdgeInsets.only(
          left: 15,
        ),
        child: Icon(
          Icons.play_arrow,
          size: 30,
          color: kBlack,
        ),
      ),
      label: const Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text(
          "Play",
          style: TextStyle(
              color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
