import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/globle_controller.dart';
import 'package:weatherapp/widgets/currrend_weather_widget.dart';
import 'package:weatherapp/widgets/header_widget.dart';

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
            ? const Center(
                child: CircularProgressIndicator(),
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
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
              
                    //theis return the loction and cureent day
                    const HeaderWidget(),
              
                    //four our current temeprer  this we get form the value json current 
                    CurrneWeather(weatherDataCurrent: globaleController.getData().getCurrentWeather())

              
                    
                  ],
                ),
            )),


      ),
    );
  }
}
