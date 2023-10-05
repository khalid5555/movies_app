import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  const MovieCard({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 20,
                offset: const Offset(0, 20)),
          ]),
    );
  }
}
