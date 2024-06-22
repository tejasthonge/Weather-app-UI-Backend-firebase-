


import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/globle_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {


  @override
  void initState() {

    GlobleController globleController = Get.put( 
      GlobleController(),
      permanent:true
      
    );
    getAdress(
      globleController.getLattitude().value,
      globleController.getLongitude().value
  );
    super.initState();
    
  }

String city ='';
  getAdress(lat,lon)async {
    ;
   List<Placemark> placemark= await placemarkFromCoordinates(lat, lon);
   log("$placemark");

    city =placemark[0].locality!;

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        
          height: 20,
          width: double.infinity,
          color: Colors.orange,
          
          child: Text( 
              city
          ),
        ),
      ],
    );
  }
}