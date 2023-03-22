import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/number_card_tile_widget.dart';
import 'package:netflix/presentation/widgets/tittle_widget.dart';

class HorizontalScrollWithNumberWidget extends StatelessWidget {
  const HorizontalScrollWithNumberWidget({
    super.key,
    required this.title,
    required this.posterList,
  });

  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TittleWidget(title: title),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => NumberCardTileWidget(
                  index: index,
                  imageUrl: posterList[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
