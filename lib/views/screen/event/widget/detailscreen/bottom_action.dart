import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/screen/event/ListParticipate.dart';

class BottomAction extends StatelessWidget {
const BottomAction({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(mainPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: mainTextColor.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 0)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(ListParticipate());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Ionicons.alarm_outline, size: 39 ),
                Image.asset('assets/images/people.png', height: 40, fit: BoxFit.contain),
                SizedBox(width: 8),
                Container(
                  height: btnHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('People', style: TextStyle(fontSize: normalTitle, color: normalTextColor, fontFamily: 'RobotoRegular')),
                      Text('31 Person', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              height: btnHeight,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: mainPadding*3, vertical: mainPadding/2),
              decoration: BoxDecoration(
                color: btnBgrColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: btnBgrColor.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(1, 1)
                  ),
                ],
              ),
              child: Text('Join Now'.toUpperCase(), style: TextStyle(fontSize: normalTitle, color: whiteColor, fontFamily: 'RobotoBold')),
            ),
          )
        ],
      ),
    );
  }
}