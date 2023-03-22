import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/horizontal_scroll_with_number_widget.dart';
import '../widgets/horizontal_scroll_widget.dart';
import 'widgets/top_banner_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'Error while getting data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    // Released past year
                    final _realeasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // trensing now
                    final _trending = state.tendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // Tense Drama
                    final _tenseDrama = state.tenseDramaMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // south indian cinema
                    final _southIndian = state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    //top 10 tv shows

                    final _top10 = state.trendingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();

                    // listView
                    return ListView(
                      children: [
                        const TopBannerWidget(),
                        if (_realeasedPastYear.length >= 10)
                          HorizontalScrollWidget(
                            title: "Released in the past year",
                            posterList: _realeasedPastYear.sublist(0, 10),
                          ),
                        if (_trending.length >= 10)
                          HorizontalScrollWidget(
                            title: "Trending Now",
                            posterList: _trending.sublist(0, 10),
                          ),
                        if (_top10.length >= 10)
                          HorizontalScrollWithNumberWidget(
                            title: "Top 10 TV Shows in India Today",
                            posterList: _top10.sublist(0, 10),
                          ),
                        if (_tenseDrama.length >= 10)
                          HorizontalScrollWidget(
                            title: "Tense Dramas",
                            posterList: _tenseDrama.sublist(0, 10),
                          ),
                        if (_southIndian.length >= 10)
                          HorizontalScrollWidget(
                            title: "South Indian Cinema",
                            posterList: _southIndian.sublist(0, 10),
                          ),
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(.5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://preview.redd.it/gj1t3nckxyx61.png?auto=webp&s=a0925041ccf11f7453ba4b27cfec24afa0f34594",
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kwidth,
                                Container(
                                  color: Colors.blue,
                                  width: 30,
                                  height: 30,
                                ),
                                kwidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: homeNavText,
                                ),
                                Text(
                                  "Movies",
                                  style: homeNavText,
                                ),
                                Text(
                                  "Categories",
                                  style: homeNavText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}
