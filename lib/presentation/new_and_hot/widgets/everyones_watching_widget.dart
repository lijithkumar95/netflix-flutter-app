import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/custom_icon_widge.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String decription;

  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.decription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kheight,
          Text(
            decription,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              letterSpacing: -0.2,
            ),
          ),
          kheight20,
          VideoWidget(url: posterPath),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomIconWidget(
                icon: Icons.send,
                title: "Share",
                fontSize: 12,
                iconSize: 24,
                textColor: Colors.grey,
                angle: -120,
              ),
              CustomIconWidget(
                icon: Icons.add,
                title: "My List",
                fontSize: 12,
                iconSize: 24,
                textColor: Colors.grey,
              ),
              CustomIconWidget(
                icon: Icons.play_arrow,
                title: "Play",
                fontSize: 12,
                iconSize: 24,
                textColor: Colors.grey,
              ),
              kwidth,
            ],
          ),
        ],
      ),
    );
  }
}
