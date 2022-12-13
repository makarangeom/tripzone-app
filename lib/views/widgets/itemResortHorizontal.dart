import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/place/detail/PlaceDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemResortHorizontal extends StatelessWidget {
ItemResortHorizontal({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          height: 220 + mainPadding,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listResorts.length,
            // This next line does the trick.
            itemBuilder: (BuildContext context, int index) {
              String item = listResorts[index]['img'];
              dynamic list = listResorts[index];
              return(
                GestureDetector(
                  onTap: () {Get.to(PlaceDetailScreen());},
                  child: Container(
                    width: 180,
                    margin: EdgeInsets.only(bottom: mainPadding),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: mainTextColor.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 0)
                        ),
                      ],
                      borderRadius: BorderRadius.circular(mainBorderRadius),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///// Display block image
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(mainBorderRadius),
                            boxShadow: [
                              BoxShadow(
                                color: mainTextColor.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 0)
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(item),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ///// Display block description
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(mainPadding/2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list['name'], style: TextStyle(fontSize: titleResort, color: mainTextColor, fontFamily: 'RobotoBold')),
                              Column(
                                children: [
                                  ///// Display distant
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin, size: titleResort),
                                      RichText(
                                        text: TextSpan(
                                          text: '11,702',
                                          style: TextStyle(fontSize: smallTitle, color: mainTextColor, fontFamily: 'RobotoRegular'),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' ' + 'km away',
                                              style: TextStyle(fontSize: smallTitle, color: normalTextColor)
                                            ),
                                          ]
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  ///// Display location and review
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                            Icon(Icons.directions, size: 16,),
                                            Text('Koh Kong', style: TextStyle(fontSize: smallTitle, color: mainTextColor, height: 1.5, fontFamily: 'RobotoRegular'))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                            Icon(Icons.star_rounded, size: 17, color: btnBgrColor),
                                            Text('(4.5)', style: TextStyle(fontSize: smallTitle, color: mainTextColor, fontFamily: 'RobotoRegular'))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  )
                )
              );
            }, 
            separatorBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.symmetric(horizontal: mainPadding/2, vertical: mainPadding))
          )
        )
      ],
    );
  }
}