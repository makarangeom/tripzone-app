import 'dart:ffi';
import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/screen/event/EventDetailScreen.dart';

class EachItem extends StatelessWidget {
const EachItem({ Key? key, required this.item }) : super(key: key);
  final item;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () { Get.to(EventDetailScreen(item: item));},
      child: Container(
        width: 280,
        margin: EdgeInsets.only(bottom: mainPadding, left: mainPadding, right: mainPadding),
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
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mainBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 0)
                      ),
                    ],
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          mainTextColor.withOpacity(0.3), 
                          BlendMode.darken
                      ),
                      image: AssetImage(item['img']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: mainPadding,
                  right: mainPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(mainPadding/2),
                      child: Column(
                      children: [
                        Text('13', style: TextStyle(fontSize: bigTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                        Text('Jul', style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular')),
                      ],
                    )
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 100,
              padding: EdgeInsets.all(mainPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['name'], style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '\$15',
                              style: TextStyle(fontSize: subTitle, color: btnBgrColor, fontFamily: 'RobotoBold'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '/' + 'person',
                                  style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular')
                                ),
                              ]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(CommunityMaterialIcons.clock_outline, size: 16),
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              text: '2',
                              style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoBold'),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' ' + 'days' + '/',
                                  style: TextStyle(fontFamily: 'RobotoRegular')
                                ),
                                TextSpan(
                                  text: '1',
                                  style: TextStyle(fontFamily: 'RobotoBold')
                                ),
                                TextSpan(
                                  text: ' ' + 'night',
                                  style: TextStyle(fontFamily: 'RobotoRegular')
                                ),
                              ]
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    width: 20, height: 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: whiteColor),
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: AssetImage(item['img']),
                                        fit: BoxFit.cover,
                                      )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 20, height: 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: whiteColor),
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: AssetImage(item['img']),
                                        fit: BoxFit.cover,
                                      )
                                    ),
                                  ),
                                  Container(
                                    width: 20, height: 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: whiteColor),
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: AssetImage(item['img']),
                                        fit: BoxFit.cover,
                                      )
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 5),
                              Text('3 Members', style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoBold'))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.directions, size: 16),
                              SizedBox(width: 3),
                              Text('Koh Kong, Cambodia', style: TextStyle(fontSize: normalTitle, color: mainTextColor, height: 1.5, fontFamily: 'RobotoRegular'))
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}