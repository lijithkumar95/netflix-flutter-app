import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    const SectionCenter(),
    const SectionBottom()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) => _widgetList[index],
          separatorBuilder: (ctx, index) => const SizedBox(height: 25),
          itemCount: _widgetList.length,
        ));
  }
}

class SectionCenter extends StatelessWidget {
  const SectionCenter({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "We'll  download a personalized selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * .35,
                          backgroundColor: Colors.grey.withOpacity(.5),
                        ),
                        DownloadsImageWidgets(
                          movieList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 160.0, top: 10),
                          angle: 15,
                          size: Size(size.width * 0.3, size.width * 0.48),
                        ),
                        DownloadsImageWidgets(
                          movieList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 160.0, top: 10),
                          angle: -15,
                          size: Size(size.width * 0.3, size.width * 0.48),
                        ),
                        DownloadsImageWidgets(
                          movieList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(top: 20),
                          angle: 0,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class SectionBottom extends StatelessWidget {
  const SectionBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: buttonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: buttonColorwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: kBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        kwidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    super.key,
    required this.movieList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  final String movieList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        width: size.width,
        height: size.height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(movieList),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
