import 'package:flutter/material.dart';
import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text.dart';
import 'package:NewsMovie/app/core/widgets/movie_card.dart';

import '../../data/models/movies_model.dart';

class MoviePage extends StatelessWidget {
  // final MoviesModel? moviesModel;
  final FinalMoviesModel? moviesModel;
  // final TestMovie? moviesModel;
  const MoviePage({this.moviesModel, super.key});
  Widget movieStars() {
    int wholeStars = moviesModel!.voteaverage!.floor();
    double decimalPart = moviesModel!.voteaverage! - wholeStars;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        App_Text(
          data: 'Rating :${moviesModel!.voteaverage! ?? ''}',
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
                height: h * .59,
                width: w,
                child: Hero(
                  tag: moviesModel!.posterpath!,
                  // tag: moviesModel!.image!,
                  child: MovieCard(
                      image:
                          "https://image.tmdb.org/t/p/original${moviesModel!.posterpath!}"),
                  // child: MovieCard(image: moviesModel!.image!.url!),
                ),
              ),
              Positioned(
                top: h * .61,
                height: h * .5,
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: moviesModel!.title.toString(),
                      // tag: moviesModel!.head!,
                      child: Material(
                        type: MaterialType.transparency,
                        child: App_Text(
                          paddingHorizontal: 25,
                          data: moviesModel!.title!,
                          size: 15,
                          maxLine: 3,
                        ),
                        // child: App_Text(data: moviesModel!.head!),
                      ),
                    ),
                    // const Spacer(),
                    movieStars(),
                    SizedBox(height: h * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        App_Text(
                          data: 'Date: ${moviesModel!.releasedate} ',
                          maxLine: 1,
                          size: 9,
                        ),
                        App_Text(
                          data: 'VoteCount: ${moviesModel!.votecount} ',
                          maxLine: 1,
                          size: 9,
                        ),
                        App_Text(
                          data: 'Country: ${moviesModel!.originallanguage} ',
                          maxLine: 1,
                          size: 10,
                          color: AppColors.kLightBlue,
                        ),
                      ],
                    ),
                    SizedBox(height: h * .02),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: App_Text(
                            data: moviesModel!.overview!,
                            // data: moviesModel!.body!,
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
