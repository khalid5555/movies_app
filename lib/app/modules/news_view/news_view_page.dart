import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/core/shared/utils/app_images.dart';
import 'package:NewsMovie/app/core/shared/utils/show_loading.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text_field.dart';
import 'package:NewsMovie/app/modules/news_view/news_details_page.dart';
import 'package:NewsMovie/app/modules/news_view/news_view_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* final List<NewsModel> moviesTmp = [
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
].obs; */
class NewsViewPage extends GetView<NewsController> {
  const NewsViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    controller.fetchNews();
    controller.focusNode.unfocus();
    return SafeArea(
      child: SelectionArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              MenuItemButton(child: Obx(() {
                return DropdownButton<String>(
                  value: controller.country[controller.countryIndex.value],
                  items:
                      controller.country.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: App_Text(data: value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.countryIndex.value =
                        controller.country.indexOf(newValue!);
                    controller.countryChange();
                  },
                );
              })),
            ],
            flexibleSpace: Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  AppImages.newsLogo,
                  fit: BoxFit.fill,
                ),
                const App_Text(
                  data: "Dis",
                  size: 23,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                const App_Text(
                  data: "covery",
                  size: 20,
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
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
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
                        focusNode: controller.focusNode,
                        onChange: (value) {
                          if (value!.trim().isEmpty) {
                            controller.fetchNews();
                          }
                          controller.search.value = value.trim();
                          controller.searchNews();
                          printInfo(info: value);
                        },
                        onSubmit: (value) {
                          if (value!.trim().isEmpty) {
                            controller.fetchNews();
                          }
                          controller.search.value = value.trim();
                          controller.searchNews();
                          controller.focusNode.unfocus();
                        },
                        // lab: 'Search',
                        hint: 'Search',
                        icon: Icons.search,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 45,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.category.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {
                                printInfo(info: "${1 + index}");
                                controller.changeCategory(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 7),
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(.8),
                                    borderRadius: BorderRadius.circular(12)),
                                child: App_Text(
                                  data: controller.category[index]
                                      .toString()
                                      .capitalize!,
                                  color: AppColors.kWhite,
                                  size: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5)
                          ],
                        );
                      },
                    ),
                  ),
                  ColoredBox(
                    color: Colors.grey.shade200,
                    child: const App_Text(
                      data: "top-headlines ",
                      color: AppColors.loginBg,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() {
                    return controller.isLoading.value == true
                        ? const Center(child: ShowLoading())
                        : controller.newsList.isEmpty
                            ? const Center(
                                child:
                                    Image(image: AssetImage(AppImages.noData)))
                            : Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  // itemCount: moviesTmp.length,
                                  itemCount: controller.newsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var news = controller.newsList[index];
                                    // var news = moviesTmp[index];
                                    return GestureDetector(
                                      onTap: () {
                                        const transitionDuration =
                                            Duration(milliseconds: 550);
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            transitionDuration:
                                                transitionDuration,
                                            reverseTransitionDuration:
                                                transitionDuration,
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child:
                                                    NewsPage(moviesModel: news),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: news.title!.contains('Removed')
                                          ? const SizedBox()
                                          : Container(
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: AppColors.kLightBlue
                                                      .withOpacity(.2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 110,
                                                    width: 100,
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.fill,
                                                      imageUrl: news.urlToImage
                                                          .toString(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                              AppImages.noData),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              SizedBox.expand(
                                                        child:
                                                            buildProgressIndicator(
                                                                downloadProgress),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        App_Text(
                                                          data: news.title
                                                              .toString(),
                                                          maxLine: 2,
                                                          size: 12,
                                                          // direction: TextDirection.rtl,
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        App_Text(
                                                          data: news.description
                                                              .toString(),
                                                          maxLine: 3,
                                                          size: 8,
                                                          // direction: TextDirection.rtl,
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        App_Text(
                                                          data:
                                                              '${news.publishedAt!.year}/'
                                                              '${news.publishedAt!.month}/'
                                                              '${news.publishedAt!.day}   '
                                                              '${news.publishedAt!.hour}:'
                                                              '${news.publishedAt!.minute}:'
                                                              '${news.publishedAt!.second}',
                                                          color: AppColors
                                                              .kGrColor,
                                                          size: 9,
                                                          // direction: TextDirection.rtl,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // const SizedBox(height: 15),
                                                ],
                                              ),
                                            ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
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
        ),
      ),
    );
  }
}
