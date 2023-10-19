import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/core/shared/utils/show_loading.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/modules/weather_page/details_weather.dart';
import 'package:movies_app/app/modules/weather_page/weather_controller.dart';

import '../../core/shared/utils/app_colors.dart';
import '../../data/models/weather_model.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /* var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width; */
    controller.getWeather();
    return const Scaffold(
      backgroundColor: AppColors.kWeatherBG,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CurrentWeather(),
            TodayWeather(),
          ],
        ),
      ),
    );
    //     ],
    //   ),
    // )
  }
}

class CurrentWeather extends GetView<WeatherController> {
  const CurrentWeather({super.key});
  @override
  Widget build(BuildContext context) {
    // controller.getWeather();
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 260,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
      glowColor: AppColors.kWeatherColor.withOpacity(0.5),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      color: AppColors.kWeatherColor,
      blurRadius: 1,
      offset: const Offset(0, 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(() {
          return controller.isLoading.value == true
              ? const ShowLoading()
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          CupertinoIcons.square_grid_2x2,
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            const Icon(CupertinoIcons.map_pin_ellipse,
                                color: Colors.white),
                            controller.locationList.isEmpty
                                ? const ShowLoading()
                                : Text(
                                    " ${controller.locationList.first.name}",
                                    // " ${currentTemp.location}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ],
                        ),
                        const Icon(Icons.more_vert, color: Colors.white)
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2, color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "Updating",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Obx(() {
                      return SizedBox(
                        height: 260,
                        child: Stack(
                          children: [
                            controller.weatherList.isEmpty
                                ? const ShowLoading()
                                : Positioned(
                                    top: -80,
                                    right: 0,
                                    left: 0,
                                    child: Image(
                                      image: NetworkImage(
                                          "https:${controller.weatherList.first.condition!.icon!}"),
                                      // image: AssetImage(currentTemp.image!),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            Positioned(
                                top: 10,
                                right: -1,
                                child: Column(
                                  children: [
                                    App_Text(
                                      size: 14,
                                      data: controller
                                          .locationList.first.country
                                          .toString(),
                                    ),
                                    App_Text(
                                      size: 14,
                                      data: controller.locationList.first.region
                                          .toString(),
                                    ),
                                    App_Text(
                                      size: 12,
                                      data: controller.locationList.first.tzid
                                          .toString(),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 150,
                              right: 0,
                              left: 0,
                              child: Center(
                                  child: Column(
                                children: [
                                  App_Text(
                                    size: 16,
                                    data: controller
                                        .weatherList.first.condition!.text!
                                        .toString(),
                                  ),
                                  Obx(() {
                                    return App_Text(
                                        size: 12,
                                        data:
                                            " ${controller.locationList.first.localtime}");
                                  }),
                                  const Divider(color: Colors.white),
                                  const SizedBox(height: 15),
                                  GlowText(
                                    controller.weatherList.first.tempc!
                                        .round()
                                        .toString(),
                                    style: const TextStyle(
                                        height: 0.1,
                                        fontSize: 50,
                                        color: AppColors.kWhite,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            )
                          ],
                        ),
                      );
                    }),
                    ExtraWeather(controller.weatherList.first)
                  ],
                );
        }),
      ),
    );
  }
}

class TodayWeather extends StatelessWidget {
  const TodayWeather({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const App_Text(
                size: 20,
                data: "Today",
                color: AppColors.kWhite,
              ),
              GestureDetector(
                onTap: () {
                  const transitionDuration = Duration(milliseconds: 550);
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: transitionDuration,
                      reverseTransitionDuration: transitionDuration,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: const DetailWeatherPage(),
                        );
                      },
                    ),
                  );
                },
                child: const Row(
                  children: [
                    App_Text(
                      size: 18,
                      data: "7 days ",
                      color: AppColors.kGrColor,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherWidget(todayWeather[0]),
                  WeatherWidget(todayWeather[1]),
                  WeatherWidget(todayWeather[2]),
                  WeatherWidget(todayWeather[3])
                ]),
          )
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  const WeatherWidget(this.weather, {super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            border: Border.all(width: 0.2, color: Colors.white),
            borderRadius: BorderRadius.circular(35)),
        child: Column(
          children: [
            App_Text(
              size: 15,
              data: "${weather.current}\u00B0",
              color: AppColors.kWhite,
            ),
            const SizedBox(height: 5),
            Image(
              image: AssetImage(weather.image!),
              width: 40,
              height: 50,
            ),
            const SizedBox(height: 5),
            App_Text(
              size: 10,
              data: weather.time!,
              color: AppColors.kWeatherColor,
            )
          ],
        ),
      ),
    );
  }
}

class ExtraWeather extends StatelessWidget {
  final WeatherModel temp;
  const ExtraWeather(this.temp, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /*  Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${temp.windkph} Km/h",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "رياح",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              "${temp.humidity} %",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "رطوبة",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
          Column(
          children: [
            const Icon(CupertinoIcons.wind, color: Colors.white),
            const SizedBox(height: 10),
            App_Text(data: "${temp.precipin} %", size: 15),
            const SizedBox(height: 10),
            const App_Text(
              data: "امطار",
              size: 15,
              fontWeight: FontWeight.normal,
            ),
          ],
        ), */
        Row(
          children: [
            const App_Text(
                data: 'كم/س', size: 10, fontWeight: FontWeight.normal),
            detailsWind(fromApi: "${temp.windkph}", text: "الرياح"),
          ],
        ),
        detailsWind(fromApi: "${temp.cloud}%", text: "سحاب"),
        detailsWind(fromApi: "${temp.humidity} %", text: "الرطوبة"),
        detailsWind(fromApi: "${temp.precipin} %", text: "امطار"),
        detailsWind(fromApi: temp.winddir!, text: "اتجاة الرياح")
      ],
    );
  }

  Widget detailsWind({required String fromApi, required String text}) {
    return Column(
      children: [
        const Icon(CupertinoIcons.wind, color: Colors.white),
        const SizedBox(height: 10),
        App_Text(
          data: fromApi,
          // data: "${temp.winddir}",
          size: 14,
        ),
        const SizedBox(height: 10),
        App_Text(
          data: text,
          // data: "اتجاة الرياح",
          size: 12,
          fontWeight: FontWeight.normal, color: AppColors.kWhite,
        ),
      ],
    );
  }
}
