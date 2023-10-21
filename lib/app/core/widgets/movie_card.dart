import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:NewsMovie/app/core/shared/utils/app_images.dart';
import 'package:NewsMovie/app/core/shared/utils/show_loading.dart';
class MovieCard extends StatelessWidget {
  final String image;
  const MovieCard({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.4),
                blurRadius: 20,
                offset: const Offset(0, 20)),
          ]),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: image,
        errorWidget: (context, url, error) => Image.asset(AppImages.noData),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            buildProgressIndicator(downloadProgress),
      ),
    );
  }
}
