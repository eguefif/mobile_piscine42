import 'package:flutter/material.dart';
import 'package:module03/models/weather_data.dart';
import 'package:module03/widget/screens/loading_screen.dart';
import 'package:module03/widget/helpers/title.dart';
import 'package:module03/widget/screens/error_screen.dart';
import 'package:module03/widget/helpers/wind_icon.dart';
import 'package:module03/widget/charts/today_chart.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.data}) : title = "Today";

  final WeatherData data;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (isNoData(data)) {
      return const LoadingScreen();
    }
    if (data.error["error"]) {
      return ErrorBody(
        data: data,
      );
    }
    if (MediaQuery.of(context).size.height > 600) {
      return TodayScreenResponsiveVertical(data: data);
    } else {
      return TodayScreenResponsiveHorizontal(data: data);
    }
  }
}

class TodayScreenResponsiveVertical extends StatelessWidget {
  const TodayScreenResponsiveVertical({super.key, required this.data});

  final WeatherData data;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleBody(data: data),
          Expanded(
            child: Column(
              children: [
                Text("Today's temperatures",
                    style: Theme.of(context).textTheme.titleMedium),
                TodayChart(
                  data: buildSeries(
                    data.today["hours"],
                    data.today["temperature"],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: data.today["hours"].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) => TodayListWeatherTile(
                  data: data,
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodayListWeatherTile extends StatelessWidget {
  const TodayListWeatherTile(
      {super.key, required this.index, required this.data});

  final WeatherData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text("${data.today["hours"][index]}:00",
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 2),
            data.today["description"][index].getIcon(25.0),
            const SizedBox(height: 2),
            Text(
              "${data.today["temperature"][index]} \u2103",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(size: 20, getWindIcon(data.today["speed"][index])),
                const SizedBox(width: 15),
                Text("${data.today["speed"][index]} km/h",
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}

class TodayScreenResponsiveHorizontal extends StatelessWidget {
  const TodayScreenResponsiveHorizontal({super.key, required this.data});

  final WeatherData data;
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TodayChart(
            data: buildSeries(
              data.today["hours"],
              data.today["temperature"],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleBodyRow(data: data),
                SizedBox(
                  width: 450,
                  height: 120,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: data.today["hours"].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => TodayListWeatherTile(
                      data: data,
                      index: index,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
