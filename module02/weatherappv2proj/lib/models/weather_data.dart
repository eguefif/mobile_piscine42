final Map<int, String> code = {
  0: "Clear sky",
  1: "Mainly clear",
  2: "Partly couldy",
  3: "Overcast",
  45: "fog",
  48: "Depositing rime fog",
  51: "Light drizzle",
  52: "Moderate drizzle",
  53: "Dense drizzle",
  56: "Light freezing drizzle",
  57: "Dense freezing drizzle",
  61: "Slight rain",
  63: "Moderate rain",
  65: "Heavy rain",
  66: "Light freezing rain",
  67: "Heavy freezing rain",
  71: "Slight snow fall",
  73: "Moderate snow fall",
  75: "Heavy snow fall",
  77: "Snow grains",
  80: "Slight rain showers",
  81: "Moderate rain showers",
  82: "Violent rain showers",
  85: "Slight snow showers",
  86: "Heavy snow showers",
  95: "Thunderstorm",
  96: "Slight thunderstom with hail",
  99: "Heavy thunderstom with hail",
};

class WeatherData {
  const WeatherData(
      {required this.location,
      required this.currentConditions,
      required this.today,
      required this.week});

  final Map<String, String> location;
  final Map<String, dynamic> currentConditions;
  final Map<String, dynamic> today;
  final Map<String, dynamic> week;

  factory WeatherData.fromJson(Map<String, dynamic> geoCoding,
      Map<String, dynamic> todayData, Map<String, dynamic> dailyData) {
    final location = getLocation(geoCoding);
    final current = getCurrentData(todayData);
    final today = getTodayData(todayData);
    final week = getDailyData(dailyData);
    return WeatherData(
        location: location,
        currentConditions: current,
        today: today,
        week: week);
  }
}

Map<String, String> getLocation(Map<String, dynamic> geoCoding) {
  Map<String, String> retval = Map();
  retval["city"] = geoCoding["name"];
  retval["state"] = geoCoding["state"];
  retval["country"] = geoCoding["country"];
  return retval;
}

Map<String, dynamic> getDailyData(Map<String, dynamic> data) {
  Map<String, dynamic> retval = Map();
  retval["date"] = [];
  retval["maxs"] = [];
  retval["mins"] = [];
  retval["description"] = [];

  List times = data["daily"]["time"];
  List maxs = data["daily"]["temperature_2m_max"];
  List mins = data["daily"]["temperature_2m_min"];
  List descriptions = data["daily"]["weather_code"];

  for (int i = 0; i < 7; i++) {
    retval["date"].add(
        "${DateTime.parse(times[i]).year}-${DateTime.parse(times[i]).month}-${DateTime.parse(times[i]).day}");
    retval["maxs"].add(maxs[i]);
    retval["mins"].add(mins[i]);
    retval["description"].add(code[descriptions[i]]);
  }
  return retval;
}

Map<String, dynamic> getTodayData(Map<String, dynamic> data) {
  Map<String, dynamic> retval = Map();
  retval["hours"] = [];
  retval["temperature"] = [];
  retval["description"] = [];
  retval["speed"] = [];

  List times = data["hourly"]["time"];
  List temp = data["hourly"]["temperature_2m"];
  List speed = data["hourly"]["wind_speed_10m"];
  List description = data["hourly"]["weather_code"];
  int startIdx = getStartIdx(times);

  for (int i = startIdx; i < startIdx + 24; i++) {
    retval["hours"].add(DateTime.parse(times[i]).hour);
    retval["temperature"].add(temp[i]);
    retval["description"].add(code[description[i]]);
    retval["speed"].add(speed[i]);
  }
  return retval;
}

int getStartIdx(List times) {
  final now = DateTime.now();

  for (int i = 0; i < times.length; i++) {
    var time = DateTime.parse(times[i]);
    if (now.hour < time.hour) {
      if (i == 0) {
        return 0;
      }
      return i - 1;
    }
  }
  return 0;
}

Map<String, dynamic> getCurrentData(Map<String, dynamic> data) {
  Map<String, dynamic> retval = Map();

  int currentIdx = getStartIdx(data["hourly"]["time"]);
  retval["temp"] = data["hourly"]["temperature_2m"][currentIdx];
  retval["description"] = code[data["hourly"]["weather_code"][currentIdx]];
  retval["speed"] = data["hourly"]["wind_speed_10m"][currentIdx];
  return retval;
}
