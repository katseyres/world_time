import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Location name for the UI
  String time = ''; // The time in that location
  String flag; // Url to an asset flag icon
  String url; // Location url for api endpoint
  bool isDayTime = false;

  WorldTime({ required this.location, required this.flag, required this.url });

  // Write Future<void> if the function is going to be asynchronous
  Future<void> getTime() async {
    // try & catch to handle errors
    try {
      // Make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(dateTime);
      // print(offset);

      // Create a datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      this.isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      this.time = DateFormat.jm().format(now); // Imported from intl
    }
    catch (error) {
      print('caught error : $error');
      time = 'could not get time data';
    }
  }
}