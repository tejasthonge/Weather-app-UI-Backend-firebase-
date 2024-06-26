
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/globle_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

 String city = '';
 String date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  void initState() {
    GlobleController globleController =
        Get.put(GlobleController(), permanent: true);
    getAdress(globleController.getLattitude().value,
        globleController.getLongitude().value);
    super.initState();
  }

 


  getAdress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    log("$placemark");

    setState(() {
      city = placemark[0].locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin:const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            city,
            style: GoogleFonts.poppins(
              fontSize: 40,
              // color:Colors.white,
              fontWeight: FontWeight.w600,
              height: 2,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin:const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            date,
            style: GoogleFonts.poppins(
              // fontSize: 20,
              // fontWeight: FontWeight.w00,
              height: 1.5,
              color:Colors.grey
              
            ),
          ),
        ),
      ],
    );
  }
}
