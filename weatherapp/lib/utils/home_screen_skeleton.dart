

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget builHomeScreenScaleton({required BuildContext context}){
   return Padding(
              
                padding: const EdgeInsets.all(20.0),
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                
                     MySkeleton(height: 50, width: 300),
                          const SizedBox(height: 20,),
                          MySkeleton(height: 20, width: 100),
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MySkeleton(height: 80, width: 90),
                             const SizedBox(width: 70,),
                
                              MySkeleton(height: 80, width: 90),
                             const SizedBox(width: 20,),
                            Spacer(),
                              MySkeleton(height: 10, width: 90),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MySkeleton(height: 60, width: 60),
                              MySkeleton(height: 60, width: 60),
                              MySkeleton(height: 60, width: 60),
                            ],
                          ),
                          const SizedBox(height: 10),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MySkeleton(height: 20, width: 60),
                              MySkeleton(height: 20, width: 60),
                              MySkeleton(height: 20, width: 60),
                            ],
                          ),
                          const SizedBox(height: 10),
                           SizedBox(
                            width: MediaQuery.of(context).size.width,
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MySkeleton(height: 150, width: 90),
                                MySkeleton(height: 150, width: 90),
                                MySkeleton(height: 150, width: 90),
                                MySkeleton(height: 150, width: 90),
                              ],
                                                   ),
                           ),
                           
                  ],
                ),
              );
}


class MySkeleton extends StatelessWidget {
  final double  height;
  final double width;
  const MySkeleton({super.key ,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return  Container( 
                        height: height,
                        width: width,
                        decoration: BoxDecoration( 
                        color: Colors.black.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(16)
                        ),

                      );
  }
}