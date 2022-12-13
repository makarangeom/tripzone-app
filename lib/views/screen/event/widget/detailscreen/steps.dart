import 'package:flutter/material.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';

class Steps extends StatelessWidget {
const Steps({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.yellow,
      height: 100,
      width: 100,
      // child: ListView.separated(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: listCategories.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     dynamic item = listCategories[index];
      //     dynamic list = listCategories[index];
      //     return(
      //       Column(
      //         children: [
      //               Text('Day 1 - 9/Jul/2022', style: TextStyle(color: mainTextColor, fontSize: smallTitle, fontFamily: item['name']=='categoryName'?'RobotoBold':'RobotoRegular')),
      //         ],
      //       )
      //     );
      //   }, 
      //   separatorBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.symmetric(horizontal: mainPadding, vertical: mainPadding))
      // ),
    );
  }
}