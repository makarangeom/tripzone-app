import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';

class Overview extends StatelessWidget {
const Overview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: mainPadding),
                decoration: BoxDecoration(
                  color: bgrDate,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Ionicons.alarm_outline, size: 39 ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start Date', style: TextStyle(fontSize: normalTitle, color: normalTextColor, fontFamily: 'RobotoRegular')),
                        Text('9/Jul/2022', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: mainPadding),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: mainPadding),
                decoration: BoxDecoration(
                  color: bgrDate,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Ionicons.alarm_outline, size: 39 ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('End Date', style: TextStyle(fontSize: normalTitle, color: normalTextColor, fontFamily: 'RobotoRegular')),
                        Text('9/Jul/2022', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: mainPadding),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Hac sed libero malesuada eu. Dictum at ac sed felis vulputate ligula. Tempus sollicitudin urna non non duis. Placerat hac massa egestas cum dolor a vestibulum. Scelerisque rhoncus, sit molestie mattis donec ut quam. Dui integer in integer mauris eu euismod arcu. Tristique lacus mi urna vivamus dignissim massa. Eget aliquet dolor porttitor tincidunt. Dui, mauris at nec pretium vestibulum, rhoncus, interdum. Consequat at vel diam turpis arcu amet, et facilisis. Nunc, amet maecenas tellus, libero amet sed senectus in nam. Luctus faucibus sociis euismod vel tristique ut penatibus nulla. Ut quis in aliquam potenti. Egestas ut varius mattis eleifend.', 
              style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular')
            ),
      ],
    );
  }
}