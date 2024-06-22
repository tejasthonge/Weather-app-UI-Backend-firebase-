import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/globle_controller.dart';
import 'package:weatherapp/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobleController globaleController = Get.put(GlobleController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body:  SafeArea( 
          child: Obx(() =>  globaleController.checkLodding().isTrue ?  
           const Center( 
              child: CircularProgressIndicator( ),
            ):
            ListView( 
                scrollDirection: Axis.vertical,
                children: [ 
                  
                  HeaderWidget(),

              ],
            )
          ),
        ),
        );
  }
}
