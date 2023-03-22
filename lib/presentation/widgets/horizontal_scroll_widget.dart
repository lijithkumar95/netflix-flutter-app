import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/card_tile_wdget.dart';
import 'package:netflix/presentation/widgets/tittle_widget.dart';

class HorizontalScrollWidget extends StatelessWidget {
  const HorizontalScrollWidget({
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
                posterList.length,
                (index) => CardTileWidget(
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
