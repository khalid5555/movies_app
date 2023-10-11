import 'package:flutter/material.dart';
import 'package:movies_app/app/core/shared/utils/app_colors.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/core/widgets/movie_card.dart';
import 'package:movies_app/app/data/models/movies_model.dart';

class SeriesPage extends StatelessWidget {
  final SearchSeriesModel? seriesModel;
  // final SeriesModel? seriesModel;
  const SeriesPage({this.seriesModel, super.key});
  Widget ratingStars() {
    int wholeStars = seriesModel!.voteaverage!.floor();
    double decimalPart = seriesModel!.voteaverage! - wholeStars;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // App_Text(
        //   data: 'Rating :${seriesModel!.voteaverage!}',
        //   size: 10,
        // ),
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
                      "https://image.tmdb.org/t/p/original${seriesModel!.posterpath!}",
                  child: MovieCard(
                      image:
                          "https://image.tmdb.org/t/p/original${seriesModel!.posterpath!}"),
                ),
              ),
              Positioned(
                top: h * .59,
                height: h * .5,
                width: w,
                child: Column(
                  children: [
                    Hero(
                      tag: seriesModel!.name!,
                      child: Material(
                        type: MaterialType.transparency,
                        child: App_Text(data: seriesModel!.name!),
                      ),
                    ),
                    SizedBox(height: h * .02),
                    ratingStars(),
                    SizedBox(height: h * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        App_Text(
                          data: 'Date: ${seriesModel!.firstairdate} ',
                          maxLine: 1,
                          size: 9,
                        ),
                        App_Text(
                          data: 'VoteCount: ${seriesModel!.votecount} ',
                          maxLine: 1,
                          size: 9,
                        ),
                        App_Text(
                          data: 'Country: ${seriesModel!.originallanguage} ',
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
                            data: seriesModel!.overview!,
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
