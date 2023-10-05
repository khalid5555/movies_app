import 'package:flutter/material.dart';
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
            ],
          ),
        );
      },
    );
  }
}
