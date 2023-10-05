import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:movies_app/app/core/shared/utils/app_colors.dart';
import 'package:movies_app/app/core/shared/utils/constants.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/data/models/movies_model.dart';
import 'package:movies_app/app/modules/series_page/series_page.dart';

class SeriesView extends StatefulWidget {
  const SeriesView({Key? key}) : super(key: key);
  @override
  _SeriesViewState createState() => _SeriesViewState();
}

class _SeriesViewState extends State<SeriesView>
    with SingleTickerProviderStateMixin {
  late final PageController _movieDetailsPageController;
  late final PageController _moviesCardPageController;
  double _moviesCardPage = 0.0;
  double _movieDetailsPage = 0.0;
  int _moviesCardIndex = 0;
  final _showMovieDetails = ValueNotifier(true);
  final List<SeriesModel> seriesTmpl = [
    SeriesModel(
        title: 'Kristian',
        details:
            'Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum.',
        image: "assets/images/id1.jpeg"),
    SeriesModel(
        title: 'Claude Rowe',
        details:
            'Deserunt eaque voluptas nesciunt excepturi nostrum inventore exercitationem.',
        image: "assets/images/id2.jpeg"),
    SeriesModel(
        title: 'In sit in rerum.',
        details:
            'Voluptatem provident sunt dolores sequi nihil saepe provident. Minima non alias vitae..',
        image: "assets/images/id3.jpeg"),
    SeriesModel(
        title: 'Kristian',
        details:
            'Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum.',
        image: "assets/images/id1.jpeg"),
    SeriesModel(
        title: 'Kristian',
        details:
            'Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum.',
        image: "assets/images/id1.jpeg"),
    SeriesModel(
        title: 'Claude Rowe',
        details:
            'Deserunt eaque voluptas nesciunt excepturi nostrum inventore exercitationem.',
        image: "assets/images/id2.jpeg"),
    SeriesModel(
        title: 'In sit in rerum.',
        details:
            'Voluptatem provident sunt dolores sequi nihil saepe provident. Minima non alias vitae..',
        image: "assets/images/id3.jpeg"),
  ];
  @override
  void initState() {
    _moviesCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(() {
        _moviesCardPageListener();
      });
    _movieDetailsPageController = PageController()
      ..addListener(() {
        _moviesDetailsPageListener();
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        return Column(
          children: [
            const Spacer(),
            // movies card
            SizedBox(
              height: h * 0.66,
              child: PageView.builder(
                controller: _moviesCardPageController,
                clipBehavior: Clip.none,
                onPageChanged: (page) {
                  setState(() {
                    _movieDetailsPageController.animateToPage(
                      page,
                      duration: const Duration(milliseconds: 550),
                      curve: const Interval(0.25, 1, curve: Curves.decelerate),
                    );
                  });
                },
                itemCount: seriesTmpl.length,
                itemBuilder: (context, index) {
                  final movies = seriesTmpl[index];
                  final progress = (_moviesCardPage - index);
                  final scale = ui.lerpDouble(1, .8, progress.abs())!;
                  final isScrolling = _moviesCardPageController
                      .position.isScrollingNotifier.value;
                  final isCurrentPage = index == _moviesCardIndex;
                  final isFirstPage = index == 0;
                  return Transform.scale(
                    scale: isScrolling && isFirstPage ? 1 - progress : scale,
                    alignment: Alignment.lerp(
                        Alignment.topLeft, Alignment.center, -progress),
                    child: GestureDetector(
                      onTap: () {
                        _showMovieDetails.value = !_showMovieDetails.value;
                        const transitionDuration = Duration(milliseconds: 550);
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: transitionDuration,
                            reverseTransitionDuration: transitionDuration,
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return FadeTransition(
                                opacity: animation,
                                child: SeriesPage(seriesModel: movies),
                              );
                            },
                          ),
                        );
                        Future.delayed(transitionDuration, () {
                          _showMovieDetails.value = !_showMovieDetails.value;
                        });
                      },
                      child: Hero(
                        tag: movies.image!,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          transform: Matrix4.identity()
                            ..translate(
                              isCurrentPage ? 0.0 : -20.0,
                              isCurrentPage ? 0.0 : 60.0,
                            ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(movies.image!),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    blurRadius: 25,
                                    offset: const Offset(0, 25)),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            //  movies details
            SizedBox(
              height: h * 0.26,
              child: PageView.builder(
                controller: _movieDetailsPageController,
                itemCount: seriesTmpl.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final movies = seriesTmpl[index];
                  final opacity = (index - _movieDetailsPage).clamp(0.0, 1.0);
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                    child: Opacity(
                      opacity: 1 - opacity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: movies.title!,
                            child: Material(
                              type: MaterialType.transparency,
                              child: App_Text(
                                data: movies.title.toString(),
                                size: 20,
                              ),
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _showMovieDetails,
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return Visibility(
                                visible: value,
                                child: App_Text(
                                  size: 12,
                                  data: movies.details.toString(),
                                  maxLine: 4,
                                ),
                              );
                            },
                            // child: App_Text(
                            //   data: movies.details.toString(),
                            //   maxLine: 4,
                            // ),
                          ),
                          Row(
                            children: [
                              const App_Text(
                                size: 8,
                                color: AppColors.kDarkGrey,
                                data: "Movies Number:  ",
                              ),
                              App_Text(
                                size: 16,
                                color: recolor().withOpacity(.7),
                                data: "${seriesTmpl.length - _moviesCardIndex}",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  _moviesCardPageListener() {
    setState(() {
      _moviesCardPage = _moviesCardPageController.page!;
      _moviesCardIndex = _moviesCardPageController.page!.round();
    });
  }

  _moviesDetailsPageListener() {
    setState(() {
      _movieDetailsPage = _movieDetailsPageController.page!;
    });
  }

  @override
  void dispose() {
    _moviesCardPageController
      ..removeListener(_moviesCardPageListener)
      ..dispose();
    _movieDetailsPageController
      ..removeListener(_moviesDetailsPageListener)
      ..dispose();
    super.dispose();
  }
}
