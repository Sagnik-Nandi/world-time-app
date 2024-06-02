import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLoc extends StatefulWidget {
  const ChooseLoc({Key? key}) : super(key: key);

  @override
  State<ChooseLoc> createState() => _ChooseLocState();
}

class _ChooseLocState extends State<ChooseLoc> {
  var locations = <WorldTime>[
    WorldTime(location: 'London', flag: 'uk.jpg', url: 'Europe/London'),
    WorldTime(location: 'Los Angeles', flag: 'usa.jpg', url: 'America/Los_Angeles'),
    WorldTime(location: 'New York', flag: 'usa.jpg', url: 'America/New_York'),
    WorldTime(location: 'Anchorage', flag: 'usa.jpg', url: 'America/Anchorage'),
    WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Kolkata', flag: 'india.jpg', url: 'Asia/Kolkata')
  ];

  void updateTime(index) async {
    WorldTime newLocation = locations[index];
    await newLocation.getTime();

    //send the data back to home screen
    Navigator.pop(context, {
      'location': newLocation.location,
      'flag': newLocation.flag,
      'time': newLocation.time,
      'isDaytime': newLocation.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          title: Text('Choose Location'),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('images/${locations[index].flag}')),
                  ),
                );
              }),
        ));
  }
}
