import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> geoDataFetcher(String entry) async {
  int index = entry.indexOf(" ");
  entry = entry.substring(0, index == -1 ? entry.length - 1 : index);
  var search =
      "https://geocoding-api.open-meteo.com/v1/search?name=$entry&count=15&language=en&format=json";

  final response = await http.get(Uri.parse(search));
  if (response.statusCode == 200) {
    try {
      var body = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> choices = body["results"]!;
      return getListFromBody(choices);
    } catch (error) {
      print("ERROR in geofetcher: $error");
    }
  }
  return Future.error("No data");
}

List<Map<String, dynamic>> getListFromBody(List<dynamic> choices) {
  List<Map<String, dynamic>> retval = [];

  for (Map<String, dynamic> entry in choices) {
    retval.add({
      "city": entry["name"] as String,
      "state": entry["admin3"] != null ? entry["admin3"] as String : "None",
      "country": entry["country"] as String,
      "latitude": entry["latitude"] as double,
      "longitude": entry["longitude"] as double,
    });
  }
  return retval;
}
