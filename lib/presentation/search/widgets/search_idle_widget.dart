import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchIdleWidgets extends StatelessWidget {
  const SearchIdleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(title: 'Top Searches'),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error Occured while getting data'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is Empty'),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        title: movie.title ?? 'No title provided',
                        imageUrl: '$imageAppendUrl${movie.backdropPath}');
                  },
                  separatorBuilder: (ctx, index) => kheight20,
                  itemCount: state.idleList.length);
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.37,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style: const TextStyle(
                color: kwhite,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlack,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhite,
            ),
          ),
        )
      ],
    );
  }
}
