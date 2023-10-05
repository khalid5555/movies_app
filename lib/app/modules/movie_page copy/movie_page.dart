import 'package:flutter/material.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/core/widgets/movie_card.dart';
import 'package:movies_app/app/data/models/movies_model.dart';

class MoviePage extends StatelessWidget {
  final MoviesModel? moviesModel;
  const MoviePage({this.moviesModel, super.key});
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
                  tag: moviesModel!.image!,
                  child: MovieCard(image: moviesModel!.image!),
                ),
              ),
              Positioned(
                top: h * .59,
                height: h * .5,
                width: w,
                child: Column(
                  children: [
                    Hero(
                      tag: moviesModel!.title!,
                      child: Material(
                        type: MaterialType.transparency,
                        child: App_Text(data: moviesModel!.title!),
                      ),
                    ),
                    // const Spacer(),
                    const MovieStars(),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: App_Text(
                        data: moviesModel!.details!,
                        size: 14,
                        maxLine: 55555555,
                      ),
                    ),
                    const Spacer(
                      flex: 6,
                    ),
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

class MovieStars extends StatelessWidget {
  const MovieStars({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 5; i++)
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
      ],
    );
  }
}
