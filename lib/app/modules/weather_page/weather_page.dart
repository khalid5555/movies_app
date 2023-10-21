import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/core/shared/utils/app_images.dart';
import 'package:movies_app/app/core/shared/utils/show_loading.dart';
import 'package:movies_app/app/core/shared/widgets/app_text.dart';
import 'package:movies_app/app/data/models/weather_hour_model.dart';
import 'package:movies_app/app/modules/weather_page/details_weather.dart';
import 'package:movies_app/app/modules/weather_page/weather_controller.dart';

import '../../core/shared/utils/app_colors.dart';

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
      height: MediaQuery.of(context).size.height - 250,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
      glowColor: AppColors.kWeatherColor.withOpacity(0.5),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      color: AppColors.kWeatherColor,
      blurRadius: 1,
      offset: const Offset(0, 10),
      child: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: controller.isLoading.value == true
              ? const Center(child: ShowLoading())
              : controller.weatherList.isEmpty
                  ? const Center(
                      child: Image(image: AssetImage(AppImages.noData)))
                  :
                  //  controller.weatherList.isEmpty &&
                  //         controller.locationList.isEmpty
                  //     ? const Center(child: Image(image: AssetImage(AppImages.noData)))
                  //     :
                  Obx(() {
                      return controller.isLoading.value == true
                          ? const ShowLoading()
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(CupertinoIcons.square_grid_2x2,
                                        color: Colors.white),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.location_on_outlined,
                                                size: 35,
                                                color: Colors.white),
                                            controller.locationList.isEmpty
                                                ? const ShowLoading()
                                                : Text(
                                                    " ${controller.locationList.first.name}",
                                                    // " ${currentTemp.location}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25),
                                                  ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            App_Text(
                                                size: 8,
                                                color: AppColors.kWhite,
                                                data:
                                                    "lat: ${controller.locationList.first.lat}"),
                                            const App_Text(
                                                size: 9, data: "  &  "),
                                            App_Text(
                                                size: 8,
                                                color: AppColors.kWhite,
                                                data:
                                                    "lon: ${controller.locationList.first.lon}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(Icons.more_vert,
                                        color: Colors.white)
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.2, color: Colors.white),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Text(
                                    "Updating",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Obx(() {
                                  return SizedBox(
                                    height: 260,
                                    child: Stack(
                                      // fit: StackFit.passthrough,
                                      children: [
                                        controller.weatherList.isEmpty
                                            ? const ShowLoading()
                                            : Positioned(
                                                top: 0,
                                                right: 0,
                                                left: 0,
                                                child: ConstrainedBox(
                                                  constraints:
                                                      const BoxConstraints(
                                                    minHeight: 200,
                                                    maxHeight: 220,
                                                    maxWidth: 170,
                                                    minWidth: 80,
                                                  ),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        "https:${controller.weatherList.first.condition!.icon!}"),
                                                    // image: AssetImage(currentTemp.image!),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                        Positioned(
                                            top: -5,
                                            right: 0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                App_Text(
                                                  size: 12,
                                                  data: controller.locationList
                                                      .first.country
                                                      .toString(),
                                                ),
                                                App_Text(
                                                  size: 12,
                                                  data: controller
                                                      .locationList.first.region
                                                      .toString(),
                                                ),
                                                App_Text(
                                                  size: 10,
                                                  data: controller
                                                      .locationList.first.tzid
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
                                                size: 21,
                                                fontFamily: "molham_bold",
                                                data: controller.weatherList
                                                    .first.condition!.text!
                                                    .toString(),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  App_Text(
                                                      size: 11,
                                                      data:
                                                          " ${controller.weatherList.first.lastupdated!.split(' ')[0]}:: بتاريخ "
                                                      // " ${controller.locationList.first.localtime}"
                                                      ),
                                                  App_Text(
                                                      size: 11,
                                                      color: AppColors.kWhite,
                                                      data:
                                                          "اخر تحديث :: ${controller.formattedTime}"
                                                      // " ${controller.locationList.first.localtime}"
                                                      ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              const Divider(
                                                  color: Colors.white),
                                              GlowText(
                                                "${controller.weatherList.first.tempc!.round()}",
                                                style: const TextStyle(
                                                    height: 0.1,
                                                    fontSize: 55,
                                                    color: AppColors.kWhite,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                                const SizedBox(height: 10),
                                ExtraWeather(controller.weatherList.first)
                              ],
                            );
                    }),
        );
      }),
    );
  }
}

class TodayWeather extends GetView<WeatherController> {
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
          Obx(
            () => controller.isLoading.value == true
                ? const Center(child: ShowLoading())
                : controller.hourList.isEmpty
                    ? const SizedBox(
                        height: 130,
                        width: 270,
                        child: Center(
                            child: Image(image: AssetImage(AppImages.noData))))
                    : SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.hourList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final hour = controller.hourList[index];
                            return WeatherWidget(hour: hour);
                          },
                        ),
                      ),
            /*  Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherWidget(todayWeather[0]),
                  // WeatherWidget(
                  //     hourlyForecast:
                  //         Get.find<WeatherController>().forecastdayList),
                  WeatherWidget(todayWeather[1]),
                  WeatherWidget(todayWeather[2]),
                  WeatherWidget(todayWeather[3])
                ]),
          ) */
          )
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Hour hour;
  WeatherWidget({Key? key, required this.hour}) : super(key: key);
  var formattedTime;
  void methodName() {
    String timeStr = hour.time!;
    DateTime time = DateTime.parse(timeStr);
    if (time.hour > 12) {
      formattedTime =
          '${time.hour - 12}:${time.minute.toString().padLeft(0, '0')} م';
    } else if (time.hour == 0) {
      formattedTime =
          '${time.hour + 12}:${time.minute.toString().padLeft(0, '0')} ص';
    } else if (time.hour == 12) {
      formattedTime =
          '${time.hour}:${time.minute.toString().padLeft(0, '0')} م';
    } else {
      formattedTime =
          '${time.hour}:${time.minute.toString().padLeft(0, '0')} ص';
    }
  }

  @override
  Widget build(BuildContext context) {
    methodName();
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: AppColors.kWeatherColor),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          App_Text(
            size: 15,
            data: "${hour.tempc!.round()}ْ",
            color: AppColors.kWhite,
          ),
          const SizedBox(height: 5),
          Image(
            fit: BoxFit.cover,
            image: NetworkImage("https:${hour.condition!.icon!}"),
            width: 55,
            height: 55,
          ),
          // const SizedBox(height: 5),
          App_Text(
            size: 10,
            data: formattedTime.toString(),
            direction: TextDirection.rtl,
            color: AppColors.kWeatherColor,
          )
        ],
      ),
    );
  }
}

class ExtraWeather extends StatelessWidget {
  final Current temp;
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
            detailsWind(
                fromApi: "${temp.windkph}",
                text: "الرياح",
                icon: Icons.wind_power_outlined),
          ],
        ),
        detailsWind(
            fromApi: "${temp.cloud}%", text: "سحاب", icon: Icons.cloud_rounded),
        detailsWind(
            fromApi: "${temp.humidity} %",
            text: "الرطوبة",
            icon: CupertinoIcons.wand_stars),
        detailsWind(
            fromApi: temp.winddir!,
            text: "اتجاة الرياح",
            icon: CupertinoIcons.wind_snow),
        detailsWind(
            fromApi: "${temp.precipin} %",
            text: "امطار",
            icon: CupertinoIcons.cloud_rain),
      ],
    );
  }

  Widget detailsWind(
      {required String fromApi, required String text, required IconData icon}) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 3),
        App_Text(
          data: fromApi,
          // data: "${temp.winddir}",
          size: 14,
        ),
        const SizedBox(height: 4),
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
/*
class WeatherWidget extends StatelessWidget {
  final Weather weather;
  const WeatherWidget(this.weather, {super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(width: 0.2, color: Colors.white),
            borderRadius: BorderRadius.circular(35)),
        child: Column(
          children: [
            Text(
              "${weather.current}\u00B0",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Image(
              image: AssetImage(weather.image!),
              width: 50,
              height: 30,
            ),
            const SizedBox(height: 5),
            Text(
              weather.time!,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}*/
