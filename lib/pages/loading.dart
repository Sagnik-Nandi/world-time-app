import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Anchorage', flag: 'usa.png', url: 'America/Anchorage');
    await instance.getTime();

    //now we replace the loading page with home page
    //but we also hv to pass the time etc. data to home page
    //we r going to pass it as a map of data (key-value pairs)
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: SpinKitFadingCube(color: Colors.white, size: 50,),
      ),
    );
  }
}
