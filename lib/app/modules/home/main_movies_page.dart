import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/core/shared/widgets/app_text_field.dart';
import 'package:movies_app/app/core/widgets/dot_Indicator.dart';
import 'package:movies_app/app/modules/movie_page/movie_page_controller.dart';
import 'package:movies_app/app/modules/movie_page/movies_view.dart';
import 'package:movies_app/app/modules/series_page/series_view%20copy.dart';
import 'package:movies_app/app/modules/series_page/series_view.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  var seriesController = Get.find<MoviePageController>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 5,
          title: Container(
              height: 50,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 5,
                    color: Colors.white,
                  ),
                ],
              ),
              child: AppTextField(
                  onChange: (value) {
                    seriesController.currentPage.value = 1;
                    seriesController.query.value = value!;
                    seriesController.getMoviesBy();
                    printInfo(info: value.toString());
                    // MoviePageController.tags.value = val!;
                    // Get.find<MoviePageController>().getMoviesBy();
                  },
                  hint: 'Search',
                  icon: Icons.search,
                  color: Colors.black)),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.zero,
            controller: _tabController,
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicator: DotIndicatorCircle(),
            physics: const BouncingScrollPhysics(),
            labelStyle:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            tabs: const [
              Tab(text: 'Movies'),
              Tab(text: 'Series'),
              Tab(text: 'Tv Shows'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          children: const [
            MoviesView(),
            SeriesView(),
            Series(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
