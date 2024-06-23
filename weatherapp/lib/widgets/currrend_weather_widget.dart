



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/constancd/custom_collors.dart';
import 'package:weatherapp/model/weather_data_current.dart';

class CurrneWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent ;
  const CurrneWeather({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Container(

      
      child: Column( 

        children: [

          temeprerWidget(),
          const SizedBox(height: 20,),
          currentWeatherMoreDeatail()
        ],
        
      )
      
    );


  }


Widget temeprerWidget(){

  return Row( 
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
            Image.asset( 
              fit: BoxFit.cover,
              height: 90,
              width: 90,
              "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png"
            ),

           Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 1,
            color: CustomColors.dividerLine,
            height: 40,
           ),

            Text(

              "${weatherDataCurrent.current.temp.toString().substring(0,2)}°",
              style: GoogleFonts.quicksand(
                fontSize:59,
                fontWeight:FontWeight.bold,
                // color:Colors.white
              ),
            ),

             Text(

              "${weatherDataCurrent.current.weather![0].description}",
              style: GoogleFonts.quicksand(
                // fontSize:59,
                // fontWeight:FontWeight.,

                color:Colors.grey
              ),
            )


          ],
        );
}


Widget currentWeatherMoreDeatail(){


  return Column( 

    children: [ 

      Row( 

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 

          Column(
            children: [
              Container( 
              
                height: 60,
                width: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.cardColor,
                ),
                child: Image.asset(
                "assets/icons/windspeed.png"
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                "${weatherDataCurrent.current.windSpeed} km/hr",
                style: GoogleFonts.poppins( 
                  // color:Colors.grey
                ),
              )
            ],
          ),

          
          Column(
            children: [
              Container( 
              
                height: 60,
                width: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.cardColor,
                ),
                child: Image.asset(
                "assets/icons/clouds.png"
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                "${weatherDataCurrent.current.clouds}%",
                style: GoogleFonts.poppins( 
                  // color:Colors.grey
                ),)
            ],
          ),

          Column(
            children: [
              Container( 
              
                height: 60,
                width: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.cardColor,
                ),
                child: Image.asset(
                "assets/icons/humidity.png"
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                "${weatherDataCurrent.current.humidity}",
                style: GoogleFonts.poppins( 
                  // color:Colors.grey
                ),)
            ],
          ),


        ],
      )
    ],
  );
}
}

