import 'package:flutter/material.dart';
import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text.dart';
import 'package:NewsMovie/app/core/widgets/movie_card.dart';
import 'package:NewsMovie/app/data/models/movies_model.dart';

class SeriesPage extends StatelessWidget {
  final SearchModel? modelSearch;
  final SeriesModel? seriesModel;
  final bool isSeries;
  // final SeriesModel? seriesModel;
  const SeriesPage(
      {Key? key, this.modelSearch, this.seriesModel, required this.isSeries})
      : super(
            key:
                key); /* 
  Widget ratingStars() {
    int wholeStars = isSeries
        ? seriesModel!.voteaverage!.floor()
        : modelSearch!.voteaverage!.floor();
    // double decimalPart = isSeries
    //     ? seriesModel!.voteaverage!
    //     : modelSearch!.voteaverage! - wholeStars;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        App_Text(
          data:
              'Rating :${isSeries ? seriesModel!.voteaverage!.floorToDouble() ?? '' : modelSearch!.voteaverage!.floorToDouble()}',
          size: 10,
        ),
        Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(10, (index) {
              if (index < wholeStars) {
                return const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                );
              } else if (index == wholeStars) {
                return const Icon(
                  Icons.star_half,
                  size: 20,
                  color: Colors.amberAccent,
                );
              } else {
                return const Icon(
                  Icons.star_border,
                  size: 20,
                  color: Colors.grey,
                );
              }
            })),
      ],
    );
  }
 */
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: h * -.01,
                height: h * .57,
                width: w,
                child: Hero(
                  tag:
                      "https://image.tmdb.org/t/p/original${isSeries ? seriesModel!.posterpath! : modelSearch!.posterpath}",
                  child: MovieCard(
                      image:
                          "https://image.tmdb.org/t/p/original${isSeries ? seriesModel!.posterpath! : modelSearch!.posterpath}"),
                  // image:
                  //     "https://image.tmdb.org/t/p/original${seriesModel!.posterpath!}"),
                ),
              ),
              Positioned(
                top: h * .59,
                height: h * .5,
                width: w,
                child: Column(
                  children: [
                    Hero(
                      tag:
                          "${isSeries ? seriesModel!.name! : modelSearch!.originalTitle}",
                      child: Material(
                        type: MaterialType.transparency,
                        child: App_Text(
                            data:
                                "${isSeries ? seriesModel!.name! : modelSearch!.originalname ?? modelSearch!.originalTitle}"),
                      ),
                    ),
                    SizedBox(height: h * .02),
                    // ratingStars(),
                    SizedBox(height: h * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        App_Text(
                          data:
                              'Date: ${isSeries ? seriesModel!.firstairdate! : modelSearch!.releasedate ?? modelSearch!.firstairdate} ',
                          maxLine: 1,
                          size: 9,
                        ),
                        Visibility(
                          visible: (isSeries
                                      ? seriesModel!.id!
                                      : modelSearch!.mediatype) ==
                                  null
                              ? false
                              : true,
                          child: App_Text(
                            data: '${isSeries ? "" : modelSearch!.mediatype} ',
                            maxLine: 1,
                            size: 10,
                            color: AppColors.kbiColor,
                          ),
                        ),
                        App_Text(
                          data:
                              'VoteCount: ${isSeries ? seriesModel!.votecount! : modelSearch!.votecount} ',
                          maxLine: 1,
                          size: 9,
                        ),
                        App_Text(
                          data:
                              'Language: ${isSeries ? seriesModel!.originallanguage! : modelSearch!.originallanguage} ',
                          maxLine: 1,
                          size: 10,
                          color: AppColors.kLightBlue,
                        ),
                      ],
                    ),
                    SizedBox(height: h * .01),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: App_Text(
                            data:
                                "${isSeries ? seriesModel!.overview! : modelSearch!.overview}",
                            size: 12,
                            maxLine: 55555555,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: h * .01),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
