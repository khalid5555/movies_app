import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';
import 'package:NewsMovie/app/core/shared/widgets/app_text.dart';
import 'package:NewsMovie/app/data/models/weather_hour_model.dart';

class DetailWeatherPage extends StatelessWidget {
  const DetailWeatherPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff030317),
      body: Column(
        children: [TomorrowWeather(), SevenDays()],
      ),
    );
  }
}

class TomorrowWeather extends StatelessWidget {
  const TomorrowWeather({super.key});
  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      color: AppColors.kWeatherColor,
      glowColor: AppColors.kWeatherColor,
      blurRadius: 40,
      offset: const Offset(0, 20),
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
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
                const Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    Text(
                      " 7 days",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Icon(Icons.more_vert, color: Colors.white)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(tomorrowTemp.image!))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const App_Text(
                      data: "Tomorrow",
                      size: 25,
                      fontWeight: FontWeight.normal,
                      height: .1,
                      color: AppColors.kWhite,
                    ),
                    SizedBox(
                      height: 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            tomorrowTemp.max.toString(),
                            style: const TextStyle(
                                fontSize: 70, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "/${tomorrowTemp.min}\u00B0",
                            style: TextStyle(
                                color: Colors.black54.withOpacity(0.3),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    App_Text(
                      data: " ${tomorrowTemp.name!}",
                      size: 20,
                      height: .5,
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, right: 50, left: 50),
            child: Column(
              children: [
                Divider(color: Colors.white),
                SizedBox(height: 10),
                // ExtraWeather(tomorrowTemp)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SevenDays extends StatelessWidget {
  SevenDays({super.key});
  final Forecast forecast = Forecast();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sevenDay.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    App_Text(
                      data: sevenDay[index].day!,
                      size: 20,
                      color: AppColors.kWhite,
                    ),
                    SizedBox(
                      width: 145,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(sevenDay[index].image!),
                            width: 40,
                          ),
                          const SizedBox(width: 18),
                          App_Text(
                            data: sevenDay[index].name!,
                            size: 17,
                            color: AppColors.kWhite,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        App_Text(
                          data: "+${sevenDay[index].max}\u00B0",
                          size: 15,
                          color: AppColors.kWhite,
                        ),
                        const SizedBox(width: 5),
                        App_Text(
                          data: "+${sevenDay[index].min}\u00B0",
                          size: 14,
                          color: AppColors.kWeatherColor,
                        ),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}
