import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};


  @override
  Widget build(BuildContext context) {
      
    //accepting parameters passed from other routes
    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;


    String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpg';
    Color txtcolor = data['isDaytime'] ? Colors.black : Colors.white;
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.blue[900]!;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            //this property is used so that image covers/fits all of the available bg
            image: DecorationImage(image: AssetImage('images/$bgImage'), fit: BoxFit.cover)
          ),
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),

          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  // this pushes a new screen on top of the home screen
                  // the home screen is still there underneath this
                  // this function will return updated data after location has been edited
                  // so all this is going to be a big async action
                  dynamic newData= await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data= (newData is Null) ? data : newData as Map;
                    // newData is Null type when we just pop w/o changing location
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.white,
                ),
                label: Text(
                  'Edit Location', 
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              SizedBox(height: 0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(color: txtcolor, fontSize: 40),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data['time'],
                style: TextStyle(color: txtcolor, fontSize: 66),
              )
            ],
          ),
        ),
      ),
    );
  }
}
