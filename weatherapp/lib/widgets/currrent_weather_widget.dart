




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/constancd/custom_collors.dart';
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/utils/toast.dart';

class CurrnetWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent ;
  const CurrnetWeather({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column( 
    
      children: [
    
        temeprerWidget(),
        const SizedBox(height: 20,),
        currentWeatherMoreDeatail(context: context)
      ],
      
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
            margin:const EdgeInsets.symmetric(vertical: 20),
            width: 1,
            color: CustomColors.dividerLine,
            height: 40,
           ),

            Text(

              "${weatherDataCurrent.current.temp.toString()}°",
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


Widget currentWeatherMoreDeatail({required BuildContext context}){


  return Column( 

    children: [ 

      Row( 

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 

          GestureDetector(
            onTap: () =>showAmarToast(msg: "Wind Speed"),
            child: Column(
              children: [
                Container( 
                
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(10),
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
          ),

          
          GestureDetector(
            onTap: () => showAmarToast(msg: "Cloud %"),
            child: Column(
              children: [
                Container( 
                
                  height: 60,
                  width: 60,
                  padding:const  EdgeInsets.all(10),
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
          ),

          GestureDetector(
            onTap: ()=>showAmarToast(msg: "Huminity"),
            child: Column(
              children: [
                Container( 
                
                  height: 60,
                  width: 60,
                  padding:const EdgeInsets.all(10),
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
          ),


        ],
      )
    ],
  );
}
}

