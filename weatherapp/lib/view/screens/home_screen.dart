import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weatherapp/controller/globle_controller.dart';
import 'package:weatherapp/utils/home_screen_skeleton.dart';
import 'package:weatherapp/widgets/currrent_weather_widget.dart';
import 'package:weatherapp/widgets/daily_wether_widget.dart';
import 'package:weatherapp/widgets/header_widget.dart';
import 'package:weatherapp/widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobleController globaleController =
      Get.put(GlobleController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(

        child: Obx(() => globaleController.checkLodding().isTrue
            ? Skeletonizer(
              enabled:globaleController.checkLodding().isTrue ,

              // effect: PaintingEffect(duration: Duration(seconds: 2)),
              child:builHomeScreenScaleton(context: context)
            )
            : Container(
            
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration:const BoxDecoration( 
                // image: DecorationImage( 
                //   fit: BoxFit.cover,
                //   image: AssetImage( 
                //     "assets/img/bg.png"
                    
                //   )
                // )
              ),
              child:ListView(
                
              
              
                  scrollDirection: Axis.vertical,
                  children: [
              
                   
                    //theis return the loction and cureent day
                    const HeaderWidget(),
              
                    //four our current temeprer  this we get form the value json current 
                    CurrnetWeather(weatherDataCurrent: globaleController.getData().getCurrentWeather()),
                    const SizedBox(height: 20,),
                    HourlyWeather(weatherDataHourly: globaleController.getData().getHourlyWeather()),
                    const SizedBox(height: 20,),
                    DailyWeather(weatherDataDaily: globaleController.getData().getDailyWeather(),)
              
              
              
              
                    
                  ],
                ),
            )
            ),


      ),
    );
  }
}


