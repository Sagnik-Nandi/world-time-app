import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  //components
  String location='';
  String time='';
  String flag=''; //url to the flag somewhere in the folder
  String url=''; //location url for the world time api
  bool isDaytime=true; //checks day or night and accordingly an img is displayed at home screen

  WorldTime({this.location='', this.flag='', this.url=''});

  Future<void> getTime() async {

    //request to the the api
    var address =Uri.parse('https://worldtimeapi.org/api/timezone/$url');
    Response response = await get(address);
    Map data = jsonDecode(response.body);
    // print(data);

    //storing and formatting data
    String datetime= data['datetime'];
    String offset= data['utc_offset'];
    var offset_hrs=int.parse(offset.substring(1,3));
    var offset_mins=int.parse(offset.substring(4,6));
    DateTime now= DateTime.parse(datetime); //datetime object ..but this converts it into utc time
    now=now.add(Duration(hours: offset_hrs, minutes: offset_mins));
    // print (datetime);
    // print(offset);
    // print(now);

    //set time and isDaytime property
    isDaytime = (now.hour>=6 && now.hour<18) ? true : false;
    time= DateFormat.jm().format(now);
  }

}

