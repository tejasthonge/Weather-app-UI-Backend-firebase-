

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/constancd/custom_collors.dart';
import 'package:weatherapp/model/weather_data_daily.dart';

// ignore: must_be_immutable
class DailyWeather extends StatelessWidget {

  WeatherDataDaily weatherDataDaily;
  DailyWeather({super.key ,required this.weatherDataDaily});

  //String mainufatulation
  String getDay({required final timeSpam}){
    DateTime  dayDateTime = DateTime.fromMillisecondsSinceEpoch(timeSpam *1000);
    String day = DateFormat("EEE").format(dayDateTime);
    return day;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 15),

            alignment: Alignment.centerLeft, 
            child: Text( 
              "Next Days",
              style: GoogleFonts.quicksand( 
                color:CustomColors.textColorBlack,
                fontSize:17,
                fontWeight:FontWeight.w500
              ),
            ),
          ),
          const SizedBox(height: 10,),
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 15),
          padding:const EdgeInsets.all(10),
        
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(20),
            color: CustomColors.cardColor.withAlpha(150)
          ),
          child: dailyList(),
        ),
      ],
    );
  }

  Widget dailyList(){

    return SizedBox( 
      height: 350,
      child: ListView.builder(
        itemCount: weatherDataDaily.daily.length > 7? 7:weatherDataDaily.daily.length,
        itemBuilder: ((context, index) {

        return SizedBox(
          height: 70,
          child: Column(
            children: [
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  Text(
                    getDay(timeSpam:  weatherDataDaily.daily[index].dt),
              
                    style: GoogleFonts.quicksand( 
                      
                    ),
                  ),
              
                  Column( 
                    children: [
                      Image.asset(
                    "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    
                    "${weatherDataDaily.daily[index].weather![0].description}",
                     style: GoogleFonts.quicksand( 
                      color:Colors.grey,
                      fontSize:10
                    ),  
                  ),
                    ],
                  ),
              
                  Text(
                    "${weatherDataDaily.daily[index].temp!.min}° to ${weatherDataDaily.daily[index].temp!.max}°",
                    style: GoogleFonts.quicksand( 
                      
                    ),
              
                  )
                ],
              ),
             const  Divider(
                color: CustomColors.dividerLine,
              )
            ],
          ),
        );
      })),
    );
  }
}