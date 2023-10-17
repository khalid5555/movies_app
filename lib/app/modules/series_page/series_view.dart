import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/core/shared/utils/app_colors.dart';
import 'package:movies_app/app/core/shared/utils/app_images.dart';
import 'package:movies_app/app/core/shared/utils/constants.dart';
import 'package:movies_app/app/core/shared/utils/show_loading.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/modules/movie_page/movie_page_controller.dart';
import 'package:movies_app/app/modules/series_page/series_details_page.dart';

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
  int testIndex = 20;
  final seriesController = Get.put(MoviePageController());
  final _showMovieDetails = ValueNotifier(true);
  /*  final List<SeriesModel> seriesTmpl = [
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
  */
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
        return Obx(() {
          return seriesController.isLoading.value == true
              ? const Center(child: ShowLoading())
              : Scaffold(
                  body: Column(
                    children: [
                      const Spacer(),
                      // series card
                      SizedBox(
                        height: h * 0.66,
                        child: PageView.builder(
                          controller: _moviesCardPageController,
                          clipBehavior: Clip.none,
                          onPageChanged: (page) {
                            setState(() {
                              testIndex = 20 - page;
                              printInfo(info: 'series page change $testIndex');
                              _movieDetailsPageController.animateToPage(
                                page,
                                duration: const Duration(milliseconds: 550),
                                curve: const Interval(
                                  0.25,
                                  1,
                                  curve: Curves.decelerate,
                                ),
                              );
                            });
                          },
                          itemCount: seriesController.seriesList.length,
                          itemBuilder: (context, index) {
                            final movies = seriesController.seriesList[index];
                            final progress = (_moviesCardPage - index);
                            final scale = ui.lerpDouble(1, .8, progress.abs())!;
                            final isScrolling = _moviesCardPageController
                                .position.isScrollingNotifier.value;
                            final isCurrentPage = index == _moviesCardIndex;
                            final isFirstPage = index == 0;
                            return Transform.scale(
                              scale: isScrolling && isFirstPage
                                  ? 1 - progress
                                  : scale,
                              alignment: Alignment.lerp(Alignment.topLeft,
                                  Alignment.center, -progress),
                              child: GestureDetector(
                                onTap: () {
                                  _showMovieDetails.value =
                                      !_showMovieDetails.value;
                                  const transitionDuration =
                                      Duration(milliseconds: 550);
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration: transitionDuration,
                                      reverseTransitionDuration:
                                          transitionDuration,
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: SeriesPage(
                                            seriesModel: movies,
                                            isSeries: true,
                                          ),
                                          // child: SeriesPage(seriesModel: movies),
                                        );
                                      },
                                    ),
                                  );
                                  Future.delayed(transitionDuration, () {
                                    _showMovieDetails.value =
                                        !_showMovieDetails.value;
                                  });
                                },
                                child: Hero(
                                  tag: movies.posterpath!,
                                  child: AnimatedContainer(
                                    clipBehavior: Clip.hardEdge,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    transform: Matrix4.identity()
                                      ..translate(
                                        isCurrentPage ? 0.0 : -20.0,
                                        isCurrentPage ? 0.0 : 60.0,
                                      ),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(.3),
                                              blurRadius: 25,
                                              offset: const Offset(0, 25)),
                                        ]),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/original${movies.posterpath!}",
                                      errorWidget: (context, url, error) =>
                                          Image.asset(AppImages.noData),
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              buildProgressIndicator(
                                                  downloadProgress),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      //  series details
                      SizedBox(
                        height: h * 0.27,
                        child: PageView.builder(
                          controller: _movieDetailsPageController,
                          itemCount: seriesController.seriesList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final movies = seriesController.seriesList[index];
                            final opacity =
                                (index - _movieDetailsPage).clamp(0.0, 1.0);
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.1),
                              child: Opacity(
                                opacity: 1 - opacity,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: movies.name!,
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: App_Text(
                                            data: movies.name.toString(),
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          App_Text(
                                            data:
                                                'Date: ${movies.firstairdate} ',
                                            maxLine: 1,
                                            size: 9,
                                          ),
                                          App_Text(
                                            data:
                                                'Language: ${movies.originallanguage} ',
                                            maxLine: 1,
                                            size: 10,
                                            color: AppColors.kLightBlue,
                                          ),
                                        ],
                                      ),
                                      ValueListenableBuilder<bool>(
                                        valueListenable: _showMovieDetails,
                                        builder: (BuildContext context, value,
                                            Widget? child) {
                                          return Visibility(
                                            visible: value,
                                            child: App_Text(
                                              size: 11,
                                              data: movies.overview.toString(),
                                              maxLine: 4,
                                            ),
                                          );
                                        },
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
                                            data: "$testIndex",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  floatingActionButton: Visibility(
                    visible: testIndex == 1 ? true : false,
                    child: SizedBox(
                      width: w * .22,
                      height: h * .065,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (testIndex == 1) {
                            seriesController.changePageSeries();
                            setState(() {
                              testIndex = 20;
                              // _moviesCardIndex = 19;
                            });
                          } else {
                            // index == 0;
                            printInfo(
                                info:
                                    "no no index ${seriesController.seriesList.length}");
                          }
                        },
                        backgroundColor: AppColors.kWhite,
                        tooltip: 'Next Page',
                        child: const App_Text(
                          data: 'Next Page',
                          size: 10,
                          color: AppColors.kbiColor,
                        ),
                      ),
                    ),
                  ),
                );
        });
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
