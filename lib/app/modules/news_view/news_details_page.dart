import 'package:flutter/material.dart';
import 'package:movies_app/app/core/shared/utils/app_colors.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/core/widgets/movie_card.dart';
import 'package:movies_app/app/data/models/news_model.dart';

import '../../core/shared/utils/app_images.dart';

class NewsPage extends StatelessWidget {
  final NewsModel moviesModel;
  const NewsPage({required this.moviesModel, super.key});
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
                  tag: 'moviesModel!.posterpath',
                  // tag: moviesModel!.image!,
                  child: moviesModel.urlToImage == null
                      ? Image.asset(AppImages.noData)
                      : MovieCard(image: moviesModel.urlToImage! ?? ''),
                  // child: MovieCard(image: moviesModel!.image!.url!),
                ),
              ),
              Positioned(
                top: h * .61,
                height: h * .5,
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: moviesModel.title.toString(),
                      // tag: moviesModel!.head!,
                      child: Material(
                        type: MaterialType.transparency,
                        child: App_Text(
                          paddingHorizontal: 18,
                          data: moviesModel.title! ?? 'no title',
                          size: 15,
                          maxLine: 3,
                        ),
                        // child: App_Text(data: moviesModel!.head!),
                      ),
                    ),
                    SizedBox(height: h * .01),
                    App_Text(
                      paddingHorizontal: 18,
                      data: ' Date: ${moviesModel.publishedAt!.year}/'
                          '${moviesModel.publishedAt!.month}/'
                          '${moviesModel.publishedAt!.day}  '
                          '${moviesModel.publishedAt!.hour}:'
                          '${moviesModel.publishedAt!.minute}:'
                          '${moviesModel.publishedAt!.second}',
                      maxLine: 1,
                      size: 9,
                    ),
                    App_Text(
                      paddingHorizontal: 18,
                      data: 'author: ${moviesModel.author!.split(',').first} ',
                      maxLine: 1,
                      size: 9,
                      color: AppColors.kLightBlue,
                    ),
                    SizedBox(height: h * .02),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: App_Text(
                            data: moviesModel.description ?? 'no data',
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
