import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
    String location;
    String time="";
    String flag;
    String url;
    late bool isDayTime ;


      WorldTime({required this.location,required this.flag,required this.url});

        Future<void> getTime() async {
           try {
              Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
              Map data=jsonDecode(response.body);

              String datetime=data['datetime'];
              String offset=data['utc_offset'].substring(1,3);

              //create date time object
              DateTime now= DateTime.parse(datetime);
              now = now.add(Duration(hours: int.parse(offset)));

              //set the time property
              time=DateFormat.jm().format(now);
              isDayTime= now.hour > 6 && now.hour < 19 ? true:false;

            }
            catch(e){
                    print('error caught');
                    time='could not get time data';
            }
    }
}
