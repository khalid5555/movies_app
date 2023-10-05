import 'package:flutter/material.dart';
import 'package:movies_app/app/core/widgets/dot_Indicator.dart';
import 'package:movies_app/app/core/widgets/movie_view.dart';
import 'package:movies_app/app/modules/details/details_page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicator: DotIndicatorCircle(),
          physics: const BouncingScrollPhysics(),
          tabs: const [
            Tab(text: 'movies'),
            Tab(text: 'series'),
            Tab(text: 'tv shows'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MovieView(),
          DetailsPage(),
          SizedBox.expand(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
