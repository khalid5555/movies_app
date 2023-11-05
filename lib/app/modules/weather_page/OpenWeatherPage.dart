import 'package:NewsMovie/app/core/shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/shared/utils/app_colors.dart';
import '../../core/shared/utils/app_images.dart';
import '../../core/shared/utils/show_loading.dart';
import '../../core/shared/widgets/app_text.dart';
import '../../data/models/weather_hour_model.dart';
import 'details_weather.dart';
import 'weather_controller.dart';

class OpenWeatherPage extends GetView<WeatherController> {
  const OpenWeatherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /* var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width; */
    // controller
    //     .getWeatherFromOpenWeather(controller.box.read("city") ?? 'القوصية');
    // final WeatherControllerTest weatherController =
    //     Get.put(WeatherControllerTest(weatherService: WeatherService()));
    return const SafeArea(
      child: SelectionArea(
        child: Scaffold(
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
        ),
      ),
    );
  }
}

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({super.key});
  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  WeatherController controller = Get.find<WeatherController>();
  var focusNode = FocusNode();
  @override
  void initState() {
    // controller
    //     .getWeatherFromOpenWeather(controller.box.read("city2") ?? 'القوصية');
    // controller
    //     .currentFromOpenWeather(controller.box.read("city2") ?? 'القوصية');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<WeatherController>().box.remove('city2');
    // controller.getWeather();
    // controller.getWeather(controller.box.read("city2"));
    // controller
    //     .getWeatherFromOpenWeather(controller.box.read("city2") ?? 'القوصية');
    // controller
    //     .getWeatherFromOpenWeather(controller.box.read("city2") ?? 'القوصية');
    // controller
    //     .currentFromOpenWeather(controller.box.read("city2") ?? 'القوصية');
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 275,
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
              : controller.cityList.isEmpty ||
                      controller.listaList.isEmpty ||
                      controller.allList.isEmpty
                  ? const Center(
                      child: Image(image: AssetImage(AppImages.noData)))
                  : Obx(() {
                      return controller.isLoading.value == true
                          ? const ShowLoading()
                          : Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.getWeatherFromOpenWeather(
                                              controller.box.read("city2"));
                                          controller.currentFromOpenWeather(
                                              controller.box.read("city2"));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          padding: const EdgeInsets.only(
                                              right: 6, left: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3.5,
                                                color: Colors.tealAccent),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: const App_Text(
                                            data: "تحديث",
                                            size: 15,
                                            fontFamily: AppConst.font_family,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.location_on_outlined,
                                                  size: 35,
                                                  color: Colors.white),
                                              controller.allList.isEmpty
                                                  ? const ShowLoading()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        setState(() {});
                                                        focusNode
                                                            .requestFocus();
                                                      },
                                                      child: App_Text(
                                                        size: 20,
                                                        maxLine: 3,
                                                        data: controller
                                                                    .cityList
                                                                    .first
                                                                    .name!
                                                                    .length >
                                                                12
                                                            ? " ${controller.cityList.first.name!.substring(0, 15)}"
                                                            : " ${controller.cityList.first.name}",
                                                        // " ${currentTemp.location}",
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              App_Text(
                                                  size: 8,
                                                  color: AppColors.kWhite,
                                                  data:
                                                      "دائرة العرض: ${controller.cityList.first.coord!.lat!.toStringAsFixed(2)}"),
                                              const App_Text(
                                                  size: 9, data: "  &  "),
                                              App_Text(
                                                  size: 8,
                                                  color: AppColors.kWhite,
                                                  data:
                                                      "خط الطول: ${controller.cityList.first.coord!.lon!.toStringAsFixed(2)}"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      /* PopupMenuButton(
                                              color: AppColors.kWhite,
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return [
                                                  const PopupMenuItem(
                                                    value: 'apiWeather',
                                                    child: Text('apiWeather'),
                                                  ),
                                                  const PopupMenuItem(
                                                    value: 'openWeather',
                                                    child:
                                                        Text('openWeather'),
                                                  ),
                                                  // controller.getWeather(
                                                  // controller
                                                  //         .box
                                                  //         .read("city") ??
                                                  //     'القوصية');
                                                ];
                                              },
                                              onSelected: (value) {
                                                if (value == 'openWeather') {
                                                  Get.to(() =>
                                                      const OpenWeatherPage());
                                                } else {}
                                              },
                                            ) */
                                      const Icon(Icons.more_vert,
                                          color: Colors.redAccent),
                                    ],
                                  ),
                                ),
                                Obx(() {
                                  final dateTime =
                                      DateTime.fromMillisecondsSinceEpoch(
                                          controller.allList.first['dt'] *
                                              1000);
                                  // final dateTime =
                                  //     DateTime.fromMillisecondsSinceEpoch(
                                  //         controller.listaList.first.dt! *
                                  //             1000);
                                  final formattedTime =
                                      DateFormat.jm('ar').format(dateTime);
                                  final formattedDate =
                                      DateFormat('yMd', 'ar').format(dateTime);
                                  return SizedBox(
                                    height: 260,
                                    child: Stack(
                                      // fit: StackFit.passthrough,
                                      children: [
                                        controller.listaList.isEmpty &&
                                                controller.cityList.isEmpty &&
                                                controller.allList.isEmpty
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
                                                    width: 50,
                                                    height: 50,
                                                    image: NetworkImage(
                                                        "http://openweathermap.org/img/wn/${controller.listaList.first.weather!.first!.icon}.png"),
                                                    // image: AssetImage(currentTemp.image!),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                        Positioned(
                                          top: Get.height / 9,
                                          right: 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              App_Text(
                                                size: 14,
                                                data: controller
                                                    .cityList.first.country
                                                    .toString(),
                                              ),
                                              /* App_Text(
                                                  size: 12,
                                                  data: controller
                                                      .locationList
                                                      .first
                                                      .region
                                                      .toString(),
                                                ),
                                                App_Text(
                                                  size: 10,
                                                  data: controller
                                                      .locationList.first.tzid
                                                      .toString(),
                                                ), */
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 150,
                                          right: 0,
                                          left: 0,
                                          child: Center(
                                              child: Column(
                                            children: [
                                              App_Text(
                                                size: 22,
                                                fontFamily:
                                                    AppConst.font_family,
                                                data: controller
                                                    .allList
                                                    .first['weather']
                                                    .first['description']
                                                    .toString(),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  App_Text(
                                                      size: 16,
                                                      fontFamily:
                                                          AppConst.font_family,
                                                      data:
                                                          " بتاريخ :: $formattedDate"
                                                      // " ${controller.listaList.first.dttxt!.split(' ')[0]}// بتاريخ "
                                                      // " ${controller.locationList.first.localtime}"
                                                      ),
                                                  App_Text(
                                                      size: 15,
                                                      color: AppColors.kWhite,
                                                      fontFamily: "molham_bold",
                                                      data:
                                                          "اخر تحديث / $formattedTime"
                                                      // "اخر تحديث / ${controller.formattedTime}"
                                                      // " ${controller.locationList.first.localtime}"
                                                      ),
                                                ],
                                              ),
                                              const SizedBox(height: 2),
                                              const Divider(
                                                  color: Colors.white),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GlowText(
                                                    // "${controller.mainList.first.temp! - 273.15.round()}",
                                                    "${(controller.allList.first['main']['temp'] - 273.15).round()}",
                                                    style: const TextStyle(
                                                        height: 0.1,
                                                        fontSize: 60,
                                                        color: AppColors.kWhite,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const App_Text(
                                                    data: '°C',
                                                    color: Color.fromARGB(
                                                        255, 0, 255, 34),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                                const SizedBox(height: 28),
                                ExtraWeather(controller.currentList.first)
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
      padding: const EdgeInsets.only(left: 28, right: 28, top: 10),
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
                        height: 140,
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
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class WeatherWidget extends StatelessWidget {
  final Hour hour;
  WeatherWidget({Key? key, required this.hour}) : super(key: key);
  String? formattedTime;
  void methodName() {
    String timeStr = hour.time!;
    DateTime time = DateTime.parse(timeStr);
    if (time.hour > 12) {
      formattedTime =
          '${time.hour - 12}:${time.minute.toString().padLeft(1, '0')} م';
    } else if (time.hour == 0) {
      formattedTime =
          '${time.hour + 12}:${time.minute.toString().padLeft(1, '0')} ص';
    } else if (time.hour == 12) {
      formattedTime =
          '${time.hour}:${time.minute.toString().padLeft(1, '0')} م';
    } else {
      formattedTime =
          '${time.hour}:${time.minute.toString().padLeft(1, '0')} ص';
    }
  }

  @override
  Widget build(BuildContext context) {
    methodName();
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 8, top: 8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: AppColors.kWeatherColor),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              GlowText(
                "${hour.tempc!.round()}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kWhite,
                ),
                glowColor: AppColors.kWhite,
              ),
              const Positioned(
                top: -4,
                right: -3,
                child: App_Text(
                    data: '°C',
                    size: 8,
                    color: Color.fromARGB(255, 100, 255, 113),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          // App_Text(
          //   size: 15,
          //   data: "${hour.tempc!.round()}ْ",
          //   color: AppColors.kWhite,
          // ),
          const SizedBox(height: 3),
          Image(
            fit: BoxFit.cover,
            image: NetworkImage("https:${hour.condition!.icon!}"),
            width: 55,
            height: 55,
          ),
          // const SizedBox(height: 5),
          App_Text(
            size: 11,
            data: formattedTime.toString(),
            // direction: TextDirection.rlt,
            color: const Color.fromARGB(255, 236, 123, 248),
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
    return SizedBox(
      height: 75,
      width: Get.width,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                const SizedBox(width: 16),
                detailsWind(
                    fromApi: "${temp.cloud}%",
                    text: "الغيوم",
                    icon: Icons.cloud_rounded),
                const SizedBox(width: 14),
                Stack(
                  children: [
                    detailsWind(
                        fromApi: "${temp.feelslikec!.round()}",
                        text: "تشعر بها",
                        icon: Icons.thermostat_outlined),
                    const Positioned(
                      top: 30,
                      right: 1,
                      child: App_Text(
                          data: '°C', size: 9, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const SizedBox(width: 14),
                detailsWind(
                    fromApi: "${temp.humidity} %",
                    text: "الرطوبة",
                    icon: CupertinoIcons.wand_stars),
                const SizedBox(width: 14),
                detailsWind(
                    fromApi: temp.winddir!,
                    text: "اتجاة الرياح",
                    icon: CupertinoIcons.wind_snow),
                const SizedBox(width: 14),
                detailsWind(
                    fromApi: "${temp.precipin} %",
                    text: "أمطار",
                    icon: CupertinoIcons.cloud_rain),
                const SizedBox(width: 14),
                detailsWind(
                    fromApi:
                        "${Get.find<WeatherController>().forecastDayList.first.day!.dailychanceofrain} %",
                    text: "فرصة أمطار",
                    icon: CupertinoIcons.cloud_rain),
                const SizedBox(width: 14),
                detailsWind(
                    fromApi: "${temp.winddegree}",
                    text: "درجة الرياح",
                    icon: Icons.wind_power),
                const SizedBox(width: 14),
                Row(
                  children: [
                    const App_Text(
                        data: 'كم/س', size: 8, fontWeight: FontWeight.normal),
                    detailsWind(
                        fromApi: "${temp.viskm}",
                        text: "الرؤية",
                        icon: Icons.remove_red_eye_outlined),
                  ],
                ),
                const SizedBox(width: 20),
                Stack(
                  children: [
                    const Positioned(
                      top: 30,
                      left: -1,
                      child: App_Text(
                          data: 'كم/س', size: 8, fontWeight: FontWeight.normal),
                    ),
                    detailsWind(
                        fromApi: "${temp.gustkph}",
                        text: "   هبوب الرياح",
                        icon: Icons.wind_power),
                  ],
                ),
                const SizedBox(width: 12),
                detailsWind(
                    fromApi: "${temp.uv}%",
                    text: "الأشعة فوق البنفسجية",
                    size: 10,
                    icon: Icons.sunny_snowing),
                // const SizedBox(width: 12),
              ],
            )
          ]),
    );
    /*    Row(
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
        detailsWind(
            fromApi: "${temp.precipin} %",
            text: "امطار",
            icon: CupertinoIcons.cloud_rain),
      ],
    ); */
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
          size: 14,
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
}