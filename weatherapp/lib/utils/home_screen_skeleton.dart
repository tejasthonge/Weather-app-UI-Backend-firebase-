

import 'package:flutter/material.dart';

Widget builHomeScreenScaleton({required BuildContext context}){
   return Padding(
              
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                  
                      const MySkeleton(height: 50, width: 300),
                            const SizedBox(height: 20,),
                            const MySkeleton(height: 20, width: 100),
                            const SizedBox(height: 20,),
                           const Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MySkeleton(height: 80, width: 90),
                                SizedBox(width: 70,),
                  
                                MySkeleton(height: 80, width: 90),
                                SizedBox(width: 20,),
                              Spacer(),
                                MySkeleton(height: 10, width: 90),
                              ],
                            ),
                            const SizedBox(height: 20,),
                          const  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MySkeleton(height: 60, width: 60),
                                MySkeleton(height: 60, width: 60),
                                MySkeleton(height: 60, width: 60),
                              ],
                            ),
                            const SizedBox(height: 20),
                             const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MySkeleton(height: 20, width: 60),
                                MySkeleton(height: 20, width: 60),
                                MySkeleton(height: 20, width: 60),
                              ],
                            ),
                            const SizedBox(height: 20),
                             SizedBox(
                              width: MediaQuery.of(context).size.width,
                               child:const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  MySkeleton(height: 150, width: 90),
                                  MySkeleton(height: 150, width: 90),
                                  MySkeleton(height: 150, width: 90),
                                  MySkeleton(height: 150, width: 90),
                                ],
                                                     ),
                             ),
                             const SizedBox(height: 20,),
                             const MySkeleton(height: 20, width: 130),
                             const SizedBox(height: 20,),
                  
                             SizedBox( height:400,
                            
                              child: ListView.builder(
                                
                                itemBuilder: (context,index){
                                  return const SizedBox( 
                                    height: 50,
                                    child:  Row( 
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [ 
                  
                                        MySkeleton(height: 20, width: 50),     
                                        MySkeleton(height: 40, width: 50),     
                                        MySkeleton(height: 20, width: 100),     
                                      ],
                                    ),
                                  );
                              }),
                            ),
                             
                    ],
                  ),
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