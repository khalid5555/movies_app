// ignore_for_file: must_be_immutable
import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/core/shared/utils/constants.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text.dart';
import 'package:NewsMovie/app/modules/weather_page/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/shared/utils/app_images.dart';
import '../../core/shared/utils/show_loading.dart';

class DetailOpenWeatherPage extends GetView<WeatherController> {
  const DetailOpenWeatherPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff030317),
        body: Column(
          children: [
            TomorrowWeather(),
            SevenDays(),
          ],
        ));
  }
}

class TomorrowWeather extends StatelessWidget {
  WeatherController controller = Get.find<WeatherController>();
  TomorrowWeather({super.key});
  @override
  Widget build(BuildContext context) {
    var weather = controller.listaList.first.dttxt!.split(' ')[0];
    DateTime date = DateTime.parse(weather).add(const Duration(days: 1));
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    String hourFormat(dynamic hourData) {
      DateTime hour = DateTime.fromMillisecondsSinceEpoch(hourData * 1000);
      String hourFormatted = DateFormat('hh:mm a').format(hour);
      return hourFormatted;
    }

    String sunrise = hourFormat(controller.cityList.first.sunrise);
    String sunset = hourFormat(controller.cityList.first.sunset);
    // printInfo(info: "ddddddd==$date");
    // printInfo(info: "wwwww==$weather");
    // printInfo(info: "ffffff==$formattedDate");
    /*    for (int i = 0; i < controller.listaList.length; i++) {
      var element = controller.listaList[i];
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(element.dt * 1000);
      String formattedDate2 = DateFormat('yyyy-MM-dd').format(dateTime);
      printInfo(
          info:
              "vvvv==${formattedDate2.startsWith("2023-11-10", 0).toString().length}");
    } */
    return Expanded(
      child: GlowContainer(
        color: AppColors.kWeatherColor,
        glowColor: AppColors.kWeatherColor,
        blurRadius: 40,
        offset: const Offset(0, 20),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        child: Obx(() {
          return controller.isLoading.value == true
              ? const Center(child: ShowLoading())
              : controller.listaList.isEmpty
                  ? const Center(
                      child: Image(image: AssetImage(AppImages.noData)))
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, right: 30, left: 30, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    )),
                                Column(
                                  children: [
                                    const Row(
                                      children: [
                                        App_Text(
                                          data: 'الطقس 6 أيام  ',
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        App_Text(
                                          size: 10,
                                          // height: .1,
                                          color: AppColors.kWhite,
                                          data: formattedDate.toString() ??
                                              controller
                                                  .forecastDayList[1].date!,
                                          // data:
                                          //     '${date.day + 1}/${date.month}/${date.year}',
                                        ),
                                        const SizedBox(width: 8),
                                        App_Text(
                                          size: 17,
                                          color: AppColors.kWeatherBG,
                                          data: DateFormat('EEEE', 'ar').format(
                                              DateTime.parse(controller
                                                  .forecastDayList[1].date!
                                                  .toString())),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(Icons.more_vert, color: Colors.white)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 6, left: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          "http://openweathermap.org/img/wn/${controller.listaList.first.weather!.first!.icon}.png"),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const App_Text(
                                      data: "غداَ",
                                      size: 35,
                                      // fontWeight: FontWeight.normal,
                                      height: .4,
                                      color: AppColors.kWhite,
                                    ),
                                    SizedBox(
                                      height: 90,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Stack(
                                            children: [
                                              GlowText(
                                                weather.startsWith(formattedDate
                                                        .toString())
                                                    ? "${(controller.listaList.first.main!.tempmax - 273.15).round()}" ??
                                                        "${controller.forecastDayList[1].day!.maxtempc!.round()}"
                                                    : "${(controller.listaList.first.main!.tempmin - 273.15).round()}",
                                                style: const TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                glowColor: AppColors.kWhite,
                                              ),
                                              const Positioned(
                                                top: 10,
                                                right: -2,
                                                child: App_Text(
                                                    data: '°C',
                                                    size: 15,
                                                    color: Color.fromARGB(
                                                        255, 118, 255, 6),
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                          App_Text(
                                            size: 28,
                                            color: AppColors.kWhite,
                                            data: "/${(controller.listaList.first.main!.tempmin - 273.15).round()}" ??
                                                '/${controller.forecastDayList[1].day!.mintempc!.round()}',
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    GlowText(
                                      controller.listaList.first.weather!.first!
                                                  .description!.length >
                                              12
                                          ? (controller.listaList.first.weather!
                                                  .first!.description)!
                                              .substring(0, 15)
                                              .toString()
                                          : "${(controller.listaList.first.weather!.first!.description)}",
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontFamily: AppConst.font_family,
                                          fontSize: 25,
                                          overflow: TextOverflow.ellipsis,
                                          height: .5,
                                          fontWeight: FontWeight.bold),
                                      glowColor: AppColors.kWhite,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 35, left: 45),
                            child: Column(
                              children: [
                                const Divider(color: Colors.white),
                                // const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Flexible(
                                      child: detailsWind(
                                          size: 9,
                                          fromApi: sunrise.toString(),
                                          text: 'شروق الشمس',
                                          icon: Icons.sunny),
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: detailsWind(
                                          size: 9,
                                          fromApi: sunset,
                                          text: 'غروب الشمس',
                                          icon: Icons.sunny_snowing),
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: detailsWind(
                                          size: 9,
                                          fromApi:
                                              '${controller.forecastDayList[1].astro!.moonrise}',
                                          text: 'شروق القمر',
                                          icon: Icons.light_mode_outlined),
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: detailsWind(
                                          size: 9,
                                          fromApi:
                                              '${controller.forecastDayList[1].astro!.moonset}',
                                          text: 'غروب القمر',
                                          icon: Icons.dark_mode_outlined),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
        }),
      ),
    );
  }
}

Widget detailsWind(
    {required String fromApi,
    double? size = 12,
    required String text,
    required IconData icon}) {
  return Column(
    children: [
      Icon(icon, color: Colors.white),
      const SizedBox(height: 3),
      App_Text(
        data: fromApi,
        // data: "${temp.winddir}",
        size: 10,
      ),
      const SizedBox(height: 4),
      App_Text(
        data: text,
        // data: "اتجاة الرياح",
        size: size,
        fontWeight: FontWeight.normal, color: AppColors.kWhite,
      ),
    ],
  );
}

class SevenDays extends StatelessWidget {
  SevenDays({super.key});
  WeatherController controller = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isLoading.value == true
            ? const Center(child: ShowLoading())
            : controller.forecastDayList.isEmpty
                ? const Center(
                    child: Image(image: AssetImage(AppImages.noData)))
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.forecastDayList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final sevenDay = controller.forecastDayList[index];
                        DateTime time =
                            DateTime.parse(sevenDay.date.toString());
                        String dayName = DateFormat('EEEE', 'ar').format(time);
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  App_Text(
                                    data: dayName.toString(),
                                    size: 18,
                                    color: dayName.contains('الجمعة')
                                        ? const Color.fromARGB(
                                            255, 129, 253, 134)
                                        : AppColors.kWhite,
                                  ),
                                  App_Text(
                                    data: sevenDay.date.toString(),
                                    size: 8,
                                    color:
                                        const Color.fromARGB(255, 255, 45, 237),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 145,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          "http:${sevenDay.day!.condition!.icon!}"),
                                      width: 55,
                                    ),
                                    const SizedBox(width: 18),
                                    Flexible(
                                      child: App_Text(
                                        data: sevenDay.day!.condition!.text!,
                                        size: 14,
                                        maxLine: 4,
                                        color: index.isOdd
                                            ? AppColors.kWhite
                                            : const Color.fromARGB(
                                                255, 119, 255, 77),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      GlowText(
                                        "${sevenDay.day!.maxtempc!.round()} ",
                                        style: const TextStyle(
                                            color: AppColors.kWhite,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        glowColor: AppColors.kWeatherColor,
                                      ),
                                      const Positioned(
                                        // top: -15,
                                        right: -2,
                                        child: App_Text(
                                            data: '°C',
                                            size: 9,
                                            color: Color.fromARGB(
                                                255, 255, 45, 237),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  // App_Text(
                                  //   data: "${sevenDay.day!.maxtempc!.round()} ",
                                  //   size: 15,
                                  //   color: AppColors.kWhite,
                                  // ),
                                  // const SizedBox(width: 5),
                                  Stack(
                                    children: [
                                      GlowText(
                                        "/ ${sevenDay.day!.mintempc!.round()} ",
                                        style: const TextStyle(
                                            color: AppColors.kWeatherColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        glowColor: AppColors.kWeatherColor,
                                      ),
                                      const Positioned(
                                        // top: -15,
                                        right: -2,
                                        child: App_Text(
                                            data: '°C',
                                            size: 7,
                                            color: Color.fromARGB(
                                                255, 255, 45, 237),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  /* App_Text(
                              data: "/ ${sevenDay.day!.mintempc!.round()}",
                              size: 12,
                              color: AppColors.kWeatherColor,
                            ), */
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
      },
    );
  }
}
