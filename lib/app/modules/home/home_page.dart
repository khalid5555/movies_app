import 'package:flutter/material.dart';
import 'package:movies_app/app/modules/home/main_movies_page.dart';
import 'package:movies_app/app/modules/news_view/news_view_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const MoviesPage(),
    const NewsViewPage(),
    /*  SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // const TopBar(),
              // const SearchInput(),
              // const PromoCard(),
              SocialPictureGroup(
                imgUrl:
                    "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg",
                title: 'dddddddddd',
                color: Colors.blue,
                onTap: () {
                  APIService().getMovies();
                },
              ),
              // const Headline(),
              // const CardListView(),
              // const SHeadline(),
            ],
          ),
        ),
      ),
    ),
    */
    const Text('three'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /*  appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            "Discovery",
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.airline_stops_outlined,
              size: 25,
              color: Color(0xff53E88B),
            ),
          )), */
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Movies", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "News", icon: Icon(Icons.restaurant)),
          BottomNavigationBarItem(label: "movies", icon: Icon(Icons.mail)),
          /*  IconBottomBar(
                text: "movies",
                icon: Icons.restaurant,
                selected: _selectedIndex == 1,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                }),
            IconBottomBar(
                text: "Map",
                icon: Icons.map,
                selected: _selectedIndex == 2,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                }), */
        ],
      ),
    );
  }
}
/*  
class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: selected ? const Color(0xff15BE77) : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              height: .1,
              color: selected ? const Color(0xff15BE77) : Colors.grey),
        )
      ],
    );
  }
}
class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Find your\nfavorie food",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.icecream,
                size: 25,
                color: Color(0xff53E88B),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 25.0, right: 25.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something wi
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xff53E88B), Color(0xff15BE77)])),
        child: Stack(
          children: [
            Opacity(
              opacity: .5,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
                  fit: BoxFit.cover),
            ),
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Image.png?alt=media&token=8256c357-cf86-4f76-8c4d-4322d1ebc06c"),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Want some\nicecream?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SocialPictureGroup extends StatelessWidget {
  const SocialPictureGroup({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.color,
    required this.onTap,
    this.width,
  }) : super(key: key);
  final String imgUrl;
  final String title;
  final Color color;
  final Function onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: Get.height / 4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              // const SizedBox(height: 5),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width,
          child: LikeListTile(
            title: "Andre Hirata",
            likes: "130",
            color: color,
          ),
        )
      ],
    );
  }
}
class LikeListTile extends StatelessWidget {
  const LikeListTile(
      {Key? key,
      required this.title,
      required this.likes,
      this.color = Colors.grey})
      : super(key: key);
  final String title;
  final String likes;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(title),
      trailing: LikeButton(onPressed: () {}, color: Colors.orange),
    );
  }
}
class LikeButton extends StatefulWidget {
  const LikeButton(
      {Key? key, required this.onPressed, this.color = Colors.black12})
      : super(key: key);
  final Function onPressed;
  final Color color;
  @override
  _LikeButtonState createState() => _LikeButtonState();
}
class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color),
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
        });
        widget.onPressed();
      },
    ));
  }
}
class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nearest Restaurants",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "The best food close to you",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text(
            "View More",
            style: TextStyle(
                color: Color(0xff15BE77), fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
class SHeadline extends StatelessWidget {
  const SHeadline({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Menu",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "The best food for you",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text(
            "View More",
            style: TextStyle(
                color: Color(0xff15BE77), fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: Get.height / 3.5,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CardView(
                "Vegan",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "8 min away"),
            CardView(
                "Italian ",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Restaurant%20Image.png?alt=media&token=43509b4c-269e-4279-8c88-36dc9ed27a66",
                "12 min away"),
            CardView(
                "Vegan",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "15 min away"),
          ],
        ),
      ),
    );
  }
}
*/