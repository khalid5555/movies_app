import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/core/shared/utils/constants.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text.dart';
import 'package:NewsMovie/app/modules/weather_page/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailWeatherPage extends StatelessWidget {
  const DetailWeatherPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: Column(
        children: [
          TomorrowWeather(),
          SevenDays(),
        ],
      ),
    );
  }
}

class TomorrowWeather extends StatelessWidget {
  WeatherController controller = Get.find<WeatherController>();
  TomorrowWeather({super.key});
  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      color: AppColors.kWeatherColor,
      glowColor: AppColors.kWeatherColor,
      blurRadius: 40,
      offset: const Offset(0, 20),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 20),
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
                          data: 'الطقس 7 أيام  ',
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    App_Text(
                      size: 10,
                      // height: .1,
                      color: AppColors.kWhite,
                      data: 'بتاريخ / ${controller.forecastDayList[1].date!}',
                    ),
                  ],
                ),
                const Icon(Icons.more_vert, color: Colors.white)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
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
                              'http:${controller.forecastDayList[1].day!.condition!.icon}'))),
                ),
                Column(
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
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              GlowText(
                                controller.forecastDayList[1].day!.maxtempc!
                                    .round()
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.bold),
                                glowColor: AppColors.kWhite,
                              ),
                              const Positioned(
                                top: 10,
                                right: -2,
                                child: App_Text(
                                    data: '°C',
                                    size: 15,
                                    color: Color.fromARGB(255, 255, 178, 249),
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          App_Text(
                            size: 38,
                            color: AppColors.kWhite,
                            data:
                                '/${controller.forecastDayList[1].day!.mintempc!.round()}',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GlowText(
                          " ${controller.forecastDayList[1].day!.condition!.text}",
                          style: const TextStyle(
                              fontFamily: AppConst.font_family,
                              fontSize: 30,
                              height: .5,
                              fontWeight: FontWeight.bold),
                          glowColor: AppColors.kWhite,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 50, left: 50),
            child: Column(
              children: [
                const Divider(color: Colors.white),
                // const SizedBox(height: 5),
                Row(
                  children: [
                    detailsWind(
                        fromApi:
                            '${controller.forecastDayList[1].astro!.sunrise}',
                        text: 'sunrise',
                        icon: Icons.sunny),
                    const SizedBox(width: 8),
                    detailsWind(
                        fromApi:
                            '${controller.forecastDayList[1].astro!.sunset}',
                        text: 'sunset',
                        icon: Icons.sunny_snowing),
                    const SizedBox(width: 8),
                    detailsWind(
                        fromApi:
                            '${controller.forecastDayList[1].astro!.moonrise}',
                        text: 'moonrise',
                        icon: Icons.mode_night_outlined),
                    const SizedBox(width: 8),
                    detailsWind(
                        fromApi:
                            '${controller.forecastDayList[1].astro!.moonset}',
                        text: 'moonset',
                        icon: Icons.dark_mode_outlined),
                  ],
                ),
              ],
            ),
          )
        ],
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
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.forecastDayList.length,
          itemBuilder: (BuildContext context, int index) {
            final sevenDay = controller.forecastDayList[index];
            String dayName = DateFormat('EEEE', 'ar')
                .format(DateTime.parse(sevenDay.date.toString()));
            return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        App_Text(
                          data: dayName.toString(),
                          size: 19,
                          color: dayName.contains('الجمعة')
                              ? const Color.fromARGB(255, 129, 253, 134)
                              : AppColors.kWhite,
                        ),
                        App_Text(
                          data: sevenDay.date.toString(),
                          size: 8,
                          color: const Color.fromARGB(255, 255, 45, 237),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 145,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage(
                                "http:${sevenDay.day!.condition!.icon!}"),
                            width: 55,
                          ),
                          const SizedBox(width: 18),
                          App_Text(
                            data: sevenDay.day!.condition!.text!,
                            size: 16,
                            color: index.isOdd
                                ? AppColors.kWhite
                                : const Color.fromARGB(255, 119, 255, 77),
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
                                  color: Color.fromARGB(255, 255, 45, 237),
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
                                  color: Color.fromARGB(255, 255, 45, 237),
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
                ));
          }),
    );
  }
}
