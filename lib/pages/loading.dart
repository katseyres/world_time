import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  /*
    Instantiate a new WorldTime object
    Wait the function getTime() returns something with Future<void>
    setState() calls the build() function again with another value for 'time'
  */
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Brussels', flag: 'belgium.png', url: 'Europe/Brussels');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  // initState function get called the first time the widget appears (ONE TIME)
  @override
  void initState() {
    super.initState();
    print('initState function ran');
    // getData();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }


  // Asynchronous code
  // async & await stop the code until the line ends its action
  // If the next line depends on the previous line, use 'async - await'
  void getData() async {
    // Simulate a network request for a username
    // After 3 seconds -> callback function
    String username = await Future.delayed(Duration(seconds: 1), () {
      return 'yoshi';
    });

    // Simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 1), () {
      return 'vegan, musician, egg collector';
    });

    print('$username - $bio');

    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }
}
