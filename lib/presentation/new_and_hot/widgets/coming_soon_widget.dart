import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';
import '../../../core/constants.dart';
import '../../widgets/custom_icon_widge.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String decription;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.decription,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: size.width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 70,
            height: size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(url: posterPath),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 36,
                          letterSpacing: -4,
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        CustomIconWidget(
                          icon: Icons.notifications_outlined,
                          title: "Remind Me",
                          fontSize: 12,
                          iconSize: 20,
                          textColor: Colors.grey,
                        ),
                        CustomIconWidget(
                          icon: Icons.info_outline,
                          title: "info",
                          fontSize: 12,
                          iconSize: 20,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Text("Coming on $day $month"),
                kheight20,
                Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                      color: Colors.grey, fontSize: 14, letterSpacing: -0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
