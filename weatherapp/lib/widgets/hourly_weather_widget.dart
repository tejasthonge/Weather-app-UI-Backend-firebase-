




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/constancd/custom_collors.dart';

import 'package:weatherapp/model/weather_data_hourly.dart';

class HourlyWeather extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyWeather({super.key ,required this.weatherDataHourly});

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
    
        Container(
                margin:const EdgeInsets.symmetric(horizontal: 15),
          child: Text( 
          
            "Today",
          style: GoogleFonts.quicksand( 
                  color:CustomColors.textColorBlack,
                  fontSize:17,
                  fontWeight:FontWeight.w500
                ),
          ),
        ),
        const SizedBox(height: 10,),
      hourlyList()
        
      ],
    );
  }

  Widget hourlyList(){
    return Container( 

          height: 150,

          padding:const EdgeInsets.all(3),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherDataHourly.hourly.length>=12? 12 :weatherDataHourly.hourly.length,
            itemBuilder: (
            (context, index) { 
            return GestureDetector(
              child: Container(  
                padding: const EdgeInsets.all(10),
              margin:const EdgeInsets.only(left: 10),
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient( 
                  colors: [ 
                    
                    CustomColors.firstGradientColor,
                    CustomColors.secondGradientColor,
                  ]
                ),
                boxShadow:const [
                  BoxShadow( 
                    color: CustomColors.cardColor,
                    offset: Offset(0.5,0),
                    blurRadius: 30,
                    spreadRadius: 1
                  )
                ]
              ),
                child: HourlyDetailWidget(
                  temp: weatherDataHourly.hourly[index].temp! ,
                  timeSpam: weatherDataHourly.hourly[index].dt!,
                  weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
                ),
              ),
            );

          })),
        );
  }
}



// ignore: must_be_immutable
class HourlyDetailWidget extends StatelessWidget {
  int temp;
  int timeSpam;
  String weatherIcon;

  String getTimeInRequrlrFormate({required int timeSpam}){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeSpam *1000);
    String regularTime = DateFormat('jm').format(time);
    return regularTime;
  }
  HourlyDetailWidget({super.key, required this.temp,required this.timeSpam ,required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
      
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text( 
            
            getTimeInRequrlrFormate(timeSpam: timeSpam),
            style: GoogleFonts.quicksand( 
                
            fontWeight:FontWeight.w600,
            color:Colors.white
          
                )
            ),
            
          
          Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
          Text( 
            "${temp.toString()}°",
            style: GoogleFonts.quicksand( 
              fontWeight:FontWeight.w600,
              color:Colors.white
            ),
          )
        ],
      ),
    );
  }
}