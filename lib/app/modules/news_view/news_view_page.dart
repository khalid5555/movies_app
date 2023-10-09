import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/core/shared/utils/app_colors.dart';
import 'package:movies_app/app/core/shared/utils/show_loading.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/core/shared/widgets/app_text_field.dart';
import 'package:movies_app/app/data/models/news_model.dart';
import 'news_view_controller.dart';
class NewsViewPage extends GetView<NewsViewController> {
  NewsViewPage({super.key});
  final List<NewsModel> moviesTmp = [
    NewsModel(
      title: 'Kristian',
      author: 'author',
      description:
          'Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum.Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum',
      urlToImage: 'urlToImage',
      publishedAt: DateTime.now(),
      // publishedAt: DateTime.parse('publishedAt'),
      content: "content",
      articleUrl: "assets/images/id1.jpeg",
    ),
    NewsModel(
      title: 'Kristian',
      author: 'author',
      description:
          'Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum.Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum',
      urlToImage: 'urlToImage',
      publishedAt: DateTime.now(),
      // publishedAt: DateTime.parse('publishedAt'),
      content: "content",
      articleUrl: "assets/images/id1.jpeg",
    ),
    NewsModel(
      title: 'Kristian',
      author: 'author',
      description:
          'Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum.Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum',
      urlToImage: 'urlToImage',
      publishedAt: DateTime.now(),
      // publishedAt: DateTime.parse('publishedAt'),
      content: "content",
      articleUrl: "assets/images/id1.jpeg",
    ),
    NewsModel(
      title: 'Kristian',
      author: 'author',
      description:
          'Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum.Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum Molestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborumMolestiae ea ratione. Veniam amet est molestiae sed consectetur quia. Non quo distinctio. Ex minima vero nihil et veritatis voluptas numquam laborum',
      urlToImage: 'urlToImage',
      publishedAt: DateTime.now(),
      // publishedAt: DateTime.parse('publishedAt'),
      content: "content",
      articleUrl: "assets/images/id1.jpeg",
    ),
  ].obs;
  @override
  Widget build(BuildContext context) {
    // controller.fetchNews();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              App_Text(
                data: "Dis",
                size: 26,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              App_Text(
                data: "covery",
                size: 22,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          // leading: const CircleAvatar(
          //   radius: 25,
          //   backgroundColor: Colors.black,
          //   child: Icon(
          //     Icons.airline_stops_outlined,
          //     size: 25,
          //     color: Color(0xff53E88B),
          //   ),
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(12, 26),
                            blurRadius: 50,
                            spreadRadius: 0,
                            color: Colors.grey.withOpacity(.1),
                          ),
                        ],
                      ),
                      child: AppTextField(
                          onClick: (value) {
                            // controller.search.value = value!;
                          },
                          // lab: 'Search',
                          hint: 'Search',
                          icon: Icons.search,
                          color: Colors.black)),
                  const App_Text(
                    data: "top-headlines ",
                    color: AppColors.loginBg,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // const Spacer(),
              /*  controller.newsList.isEmpty
                  // moviesTmp.isEmpty
                  ? const Center(child: ShowLoading())
                  : */
              Obx(() {
                return controller.isLoading.value == true
                    ? const ShowLoading()
                    : Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          // itemCount: moviesTmp.length,
                          itemCount: controller.newsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var news = controller.newsList[index];
                            // var news = moviesTmp[index];
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: AppColors.kGrColor.withOpacity(.1)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 110,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: news.urlToImage == null ||
                                                news.articleUrl == null
                                            ? const DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "assets/images/id2.jpeg"),
                                              )
                                            : DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    news.urlToImage.toString()),
                                              ),
                                        color: AppColors.kPrColor),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        App_Text(
                                          data: news.title.toString(),
                                          maxLine: 2,
                                          size: 12,
                                          // direction: TextDirection.rtl,
                                        ),
                                        const SizedBox(height: 5),
                                        App_Text(
                                          data: news.description.toString(),
                                          maxLine: 3,
                                          size: 8,
                                          // direction: TextDirection.rtl,
                                        ),
                                        const SizedBox(height: 5),
                                        App_Text(
                                          data: '${news.publishedAt!.year}/'
                                              '${news.publishedAt!.month}/'
                                              '${news.publishedAt!.day}   '
                                              '${news.publishedAt!.hour}:'
                                              '${news.publishedAt!.minute}:'
                                              '${news.publishedAt!.second}',
                                          color: AppColors.kGrColor,
                                          size: 9,
                                          // direction: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const SizedBox(height: 15),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              thickness: 1,
                              color: AppColors.kGrColor.withOpacity(.3),
                              indent: 110,
                              // endIndent: 20,
                            );
                          },
                        ),
                      );
              }),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
