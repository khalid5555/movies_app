import 'package:flutter/material.dart';
import 'package:movies_app/app/core/widgets/dot_Indicator.dart';
import 'package:movies_app/app/core/widgets/movies_view.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage>
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
        // backgroundColor: Colors.black,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
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
          SizedBox.expand(),
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
