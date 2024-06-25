


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weatherapp/constancd/custom_collors.dart';

void showAmarToast({required String msg}){
    Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.white,
                 gravity: ToastGravity.BOTTOM,
                backgroundColor: CustomColors.secondGradientColor

                );
}