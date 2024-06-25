import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/view/screens/home_screen.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({super.key});

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(seconds: 3),()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomeScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container( 

        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration( 
          image: DecorationImage( 
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/img/splash.png"
            )
          ),


        ),
        child: Container(
          height: 20,
          // color: Colors.red,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(right: 30,bottom: 60,left: 40),
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              Text("by -",
                style: GoogleFonts.poppins(
                  fontSize:10
                ),
              ),
               Text("www.tejasthonge.tech",
                style: GoogleFonts.quicksand(
                  fontSize:10,
                  
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
