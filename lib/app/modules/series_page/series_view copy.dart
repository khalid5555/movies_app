import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/core/shared/utils/app_colors.dart';
import 'package:movies_app/app/core/shared/utils/constants.dart';
import 'package:movies_app/app/core/shared/utils/show_loading.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/modules/movie_page/movie_page_controller.dart';
import 'package:movies_app/app/modules/series_page/series_details_page.dart';

class Series extends StatefulWidget {
  const Series({Key? key}) : super(key: key);
  @override
  _SeriesState createState() => _SeriesState();
}

class _SeriesState extends State<Series> with SingleTickerProviderStateMixin {
  late final PageController _movieDetailsPageController;
  late final PageController _moviesCardPageController;
  double _moviesCardPage = 0.0;
  double _movieDetailsPage = 0.0;
  int _moviesCardIndex = 0;
  final seriesController = Get.put(MoviePageController());
  final _showMovieDetails = ValueNotifier(true);
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
              : Column(
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
                            _movieDetailsPageController.animateToPage(
                              page,
                              duration: const Duration(milliseconds: 550),
                              curve: const Interval(0.25, 1,
                                  curve: Curves.decelerate),
                            );
                          });
                        },
                        itemCount: seriesController.searchList.length,
                        itemBuilder: (context, index) {
                          final movies = seriesController.searchList[index];
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
                            alignment: Alignment.lerp(
                                Alignment.topLeft, Alignment.center, -progress),
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
                                        child: SeriesPage(seriesModel: movies),
                                      );
                                    },
                                  ),
                                );
                                Future.delayed(transitionDuration, () {
                                  _showMovieDetails.value =
                                      !_showMovieDetails.value;
                                });
                              },
                              child: movies.posterpath == null
                                  ? Hero(
                                      tag: "movies.posterpath!",
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        transform: Matrix4.identity()
                                          ..translate(
                                            isCurrentPage ? 0.0 : -20.0,
                                            isCurrentPage ? 0.0 : 60.0,
                                          ),
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/no-data-found.jpg"),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.3),
                                                blurRadius: 25,
                                                offset: const Offset(0, 25)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Hero(
                                      tag: movies.posterpath!,
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        transform: Matrix4.identity()
                                          ..translate(
                                            isCurrentPage ? 0.0 : -20.0,
                                            isCurrentPage ? 0.0 : 60.0,
                                          ),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/original${movies.posterpath!}"),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.3),
                                                blurRadius: 25,
                                                offset: const Offset(0, 25)),
                                          ],
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
                        itemCount: seriesController.searchList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final movies = seriesController.searchList[index];
                          final title =
                              movies.originalname ?? movies.originalTitle;
                          final date =
                              movies.firstairdate ?? movies.releasedate;
                          final opacity =
                              (index - _movieDetailsPage).clamp(0.0, 1.0);
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                            child: Opacity(
                              opacity: 1 - opacity,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: movies.originalTitle.toString(),
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: App_Text(
                                          data: title.toString(),
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
                                          data: date.toString(),
                                          size: 9,
                                        ),
                                        App_Text(
                                          data: movies.mediatype.toString(),
                                          size: 12,
                                          color: AppColors.kbiColor,
                                        ),
                                        App_Text(
                                          data:
                                              'country: ${movies.originallanguage} ',
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
                                            size: 12,
                                            data: movies.overview.toString(),
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
                                          data:
                                              "${seriesController.searchList.length - _moviesCardIndex}",
                                        ),
                                        SizedBox(width: Get.width * .2),
                                        TextButton(
                                          clipBehavior: Clip.hardEdge,
                                          onPressed: () {
                                            if (seriesController
                                                        .searchList.length -
                                                    _moviesCardIndex ==
                                                1) {
                                              seriesController.changePage(
                                                  MoviePageController
                                                      .search.value += 1);
                                            } else {
                                              // index == 0;
                                              printInfo(
                                                  info:
                                                      "no no index ${seriesController.searchList.length}");
                                            }
                                          },
                                          child: const App_Text(
                                            data: 'next page',
                                            size: 12,
                                          ),
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
/* 
 AnimatedContainer(
                                        duration =
                                            const Duration(milliseconds: 300),
                                        curve = Curves.easeInOut,
                                        transform = Matrix4.identity()
                                          ..translate(
                                            isCurrentPage ? 0.0 : -20.0,
                                            isCurrentPage ? 0.0 : 60.0,
                                          ),
                                        decoration = BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/no-data-found.jpg"),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.3),
                                                blurRadius: 25,
                                                offset: const Offset(0, 25)),
                                          ],
                                        ),
                                      ) */