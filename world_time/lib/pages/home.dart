import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    //set background
    String bgImage=data['isDayTime'] ? 'day1.jpg':'night.jpg';
    Color bgColor=data['isDayTime'] ? Colors.lightBlue: Colors.black12;
    Color text= data['isDayTime'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container (
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[
                        Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: 2.0,
                              color: text,
                            ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style:TextStyle(
                      fontSize: 66.0,
                      color: text,
                    ),
                  ),
                  IconButton(
                    onPressed: () async{
                      dynamic result= await Navigator.pushNamed ( context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'isDayTime':result['isDayTime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(Icons.location_city_outlined,
                    size: 40.0,
                    color: text,
                    ),
                  ),
                ],
              ),
            ),
          ),

      ),
    );
  }
}
