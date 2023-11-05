import 'package:NewsMovie/app/modules/weather_page/OpenWeatherPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';

import '../../core/shared/utils/app_colors.dart';
import '../../core/shared/utils/app_images.dart';
import '../../core/shared/utils/show_loading.dart';
import '../../core/shared/widgets/app_text.dart';
import '../../data/models/weather_hour_model.dart';
import 'details_weather.dart';
import 'weather_controller.dart';

class WeatherPageTest extends GetView<WeatherController> {
  const WeatherPageTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /* var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width; */
    // controller.getWeather(controller.box.read("city") ?? 'القوصية');
    // controller
    //     .getWeatherFromOpenWeather(controller.box.read("city") ?? 'القوصية');
    // final WeatherControllerTest weatherController =
    //     Get.put(WeatherControllerTest(weatherService: WeatherService()));
    return const SelectionArea(
      child: Scaffold(
        backgroundColor: AppColors.kWeatherBG,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CurrentWeather(),
              TodayWeather(),
              /*       AppTextField(
                onChange: (value) {
                  // controller.fetchData(value!);
                  printInfo(info: 'vvvvvvvvvvvv  $value');
                  printInfo(
                      info: 'ccccccccccccccccc  ${controller.box.read("city")}');
                },
                hint: 'search',
                icon: Icons.search_outlined,
              ),
              controller.box.read("city") == ''
                  ? Text(
                      'City: ${controller.weatherData.value['location']['name']}')
                  : Text('City: ${controller.box.read("city")}')
              // const Text('Loading...') */
            ],
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
  bool searchBar = false;
  var focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // Get.find<WeatherController>().box.remove('city');
    // controller.getWeather();
    // controller.getWeather(controller.box.read("city"));
    controller.getWeather(controller.box.read("city") ?? 'القوصية');
    // controller
    //     .getWeatherFromOpenWeather(controller.box.read("city2") ?? 'القوصية');
    // controller
    //     .currentFromOpenWeather(controller.box.read("city2") ?? 'القوصية');
    return GestureDetector(
      onTap: () {
        if (searchBar) {
          setState(() {
            searchBar = false;
          });
        }
      },
      child: GlowContainer(
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
                : controller.currentList.isEmpty ||
                        controller.locationList.isEmpty
                    ? const Center(
                        child: Image(image: AssetImage(AppImages.noData)))
                    : Obx(() {
                        return controller.isLoading.value == true
                            ? const ShowLoading()
                            : Column(
                                children: [
                                  Container(
                                      child: searchBar
                                          ? TextField(
                                              focusNode: focusNode,
                                              decoration: InputDecoration(
                                                  hintStyle: const TextStyle(
                                                      color: AppColors.kWhite,
                                                      fontSize: 11),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  fillColor:
                                                      const Color.fromARGB(255,
                                                              140, 209, 250)
                                                          .withOpacity(.5),
                                                  filled: true,
                                                  hintText:
                                                      " 30.0,27.0 أدخل اسم المدينة او خط الطول والعرض مثلا "),
                                              textInputAction:
                                                  TextInputAction.search,
                                              /*  onChanged: (value) {
                                                  setState(() {
                                                    // controller.entryValue =
                                                    //     value.trim();
                                                    // controller.search2();
                                                    // controller.query = value.trim();
                                                    // controller.box.write(
                                                    //     "city", value.trim());
                                                  });
                                                }, */
                                              onSubmitted: (value) async {
                                                // if (value.trim() ==
                                                //     controller.weatherData
                                                //         .value['name']) {
                                                controller.box.write(
                                                    "city", value.trim());
                                                setState(() {
                                                  searchBar = false;
                                                  // controller.entryValue.value =
                                                  //     value.trim();
                                                });
                                                // controller.search2();
                                                // controller.box.write(
                                                //     "city", value.trim());
                                                // showDialog(
                                                //     context: context,
                                                //     builder:
                                                //         (BuildContext context) {
                                                //       return AlertDialog(
                                                //         backgroundColor:
                                                //             const Color
                                                //                 .fromARGB(255,
                                                //                 201, 201, 223),
                                                //         title: const Text(
                                                //             "City not found"),
                                                //         content: const Text(
                                                //             "Please check the city name"),
                                                //         actions: [
                                                //           TextButton(
                                                //               onPressed: () {
                                                //                 Navigator.of(
                                                //                         context)
                                                //                     .pop();
                                                //               },
                                                //               child: const Text(
                                                //                   "Ok"))
                                                //         ],
                                                //       );
                                                //     });
                                                // // controller.getWeather();
                                                // } else {
                                                // setState(() {
                                                //   controller.entryValue =
                                                //       value.trim();
                                                // });
                                                // controller.box.write(
                                                //     "city", value.trim());
                                                controller
                                                    .getWeather(value.trim());
                                                printInfo(
                                                    info:
                                                        'in write storage ${controller.box.read("city")}');
                                              },
                                            )
                                          :
                                          /*  Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                CupertinoIcons.square_grid_2x2,
                                                color: Colors.white,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: Colors.white),
                                                  GestureDetector(
                                                      onTap: () {
                                                        printInfo(
                                                            info:
                                                                'zzzzzz ${controller.box.read("city")}');
                                                        searchBar = true;
                                                        setState(() {});
                                                        focusNode
                                                            .requestFocus();
                                                      },
                                                      child:
                                                          /* controller.box
                                                                  .read(
                                                                      "city") ==
                                                              ''
                                                          ? Text(
                                                              ' ${controller.locationList.first.name}')
                                                          : */
                                                          App_Text(
                                                              size: 20,
                                                              data:
                                                                  ' ${controller.query ?? ''}')),
                                                ],
                                              ),
                                              const Icon(Icons.more_vert,
                                                  color: Colors.white)
                                            ],
                                          ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.2, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const App_Text(
                                      data: "update",
                                    ),
                                  ), */
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.getWeather(
                                                        controller.box
                                                            .read("city"));
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 6, left: 8),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 3.5,
                                                          color: Colors
                                                              .yellowAccent),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                    ),
                                                    child: const App_Text(
                                                      data: "تحديث",
                                                      size: 15,
                                                      fontFamily: 'molham_bold',
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            size: 35,
                                                            color:
                                                                Colors.white),
                                                        controller.locationList
                                                                .isEmpty
                                                            ? const ShowLoading()
                                                            : GestureDetector(
                                                                onTap: () {
                                                                  printInfo(
                                                                      info:
                                                                          'onTap ${controller.box.read("city")}');
                                                                  searchBar =
                                                                      true;
                                                                  setState(
                                                                      () {});
                                                                  focusNode
                                                                      .requestFocus();
                                                                },
                                                                child: App_Text(
                                                                  size: 20,
                                                                  maxLine: 3,
                                                                  data: controller
                                                                              .locationList
                                                                              .first
                                                                              .name!
                                                                              .length >
                                                                          12
                                                                      ? " ${controller.locationList.first.name!.substring(0, 15)}"
                                                                      : " ${controller.locationList.first.name}",
                                                                  // " ${currentTemp.location}",
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        App_Text(
                                                            size: 8,
                                                            color: AppColors
                                                                .kWhite,
                                                            data:
                                                                "دائرة العرض: ${controller.locationList.first.lat}"),
                                                        const App_Text(
                                                            size: 9,
                                                            data: "  &  "),
                                                        App_Text(
                                                            size: 8,
                                                            color: AppColors
                                                                .kWhite,
                                                            data:
                                                                "خط الطول: ${controller.locationList.first.lon}"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                PopupMenuButton(
                                                  color: AppColors.kWhite,
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return [
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
                                                    if (value ==
                                                        'openWeather') {
                                                      Get.to(() =>
                                                          const OpenWeatherPage());
                                                    }
                                                  },
                                                )
                                              ],
                                            )),
                                  /* GestureDetector(
                                    onTap: () {
                                      controller.getWeather(
                                          controller.box.read("city"));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.2, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        "تحديث",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ), */
                                  Obx(() {
                                    return SizedBox(
                                      height: 260,
                                      child: Stack(
                                        // fit: StackFit.passthrough,
                                        children: [
                                          controller.currentList.isEmpty &&
                                                  controller
                                                      .locationList.isEmpty
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
                                                          "https:${controller.currentList.first.condition!.icon!}"),
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
                                                        .locationList
                                                        .first
                                                        .country
                                                        .toString(),
                                                  ),
                                                  App_Text(
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
                                                  size: 22,
                                                  fontFamily: "molham_bold",
                                                  data: controller.currentList
                                                      .first.condition!.text!
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
                                                            "molham_bold",
                                                        data:
                                                            " ${controller.currentList.first.lastupdated!.split(' ')[0]}/ بتاريخ "
                                                        // " ${controller.locationList.first.localtime}"
                                                        ),
                                                    App_Text(
                                                        size: 15,
                                                        color: AppColors.kWhite,
                                                        fontFamily:
                                                            "molham_bold",
                                                        data:
                                                            "اخر تحديث / ${controller.formattedTime}"
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
                                                      "${controller.currentList.first.tempc!.round()}",
                                                      style: const TextStyle(
                                                          height: 0.1,
                                                          fontSize: 60,
                                                          color:
                                                              AppColors.kWhite,
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
      ),
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
            direction: TextDirection.rtl,
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
