import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.width * .5,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              }
            },
            errorBuilder: (_, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(.5),
            radius: 22,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kwhite,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
