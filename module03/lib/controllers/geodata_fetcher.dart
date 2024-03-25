import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> geoDataFetcher(String entry) async {
  var search =
      "https://geocoding-api.open-meteo.com/v1/search?name=$entry&count=5&language=en&format=json";

  try{ 
  final response = await http.get(Uri.parse(search));
  if (response.statusCode == 200) {
    try {
      var body = jsonDecode(response.body) as Map<String, dynamic>;
      if (body.containsKey("results")) {
        List<dynamic> choices = body["results"]!;
        return getListFromBody(choices, entry);
      }
    } catch (error) {
      return Future.error("No data");
    }
  }
  }
  catch(error) {
    return Future.error("The service connection is lost, please check your internet connection or try again later");
  }
  return Future.error("Could not find any result for the supplied address or coordinates");
}

List<Map<String, dynamic>> getListFromBody(
    List<dynamic> choices, String entry) {
  List<Map<String, dynamic>> retval = [];
  String state = "None";

  for (Map<String, dynamic> entry in choices) {
    if (entry["admin1"] != null || entry["admin1_id"] != null) {
      state = entry["admin1"] != null ? entry["admin1"] as String : entry["admin1_id"];
    }
    retval.add({
      "city": entry["name"] as String,
      "country": entry["country"] as String,
      "latitude": entry["latitude"] as double,
      "longitude": entry["longitude"] as double,
      "state": state,
    });
  }
  return retval;
}