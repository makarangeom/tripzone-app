import 'package:flutter/material.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';

class Including extends StatelessWidget {
Including({ Key? key }) : super(key: key);

  final List<String> listItem = [
    'Breakfast', 'Coffee', 'Guide'
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: listItem.map((item) {
              var index = listItem.indexOf(item);
              return Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 16.0,
                        height: 16.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: mainTextColor),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: mainTextColor
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: mainPadding),
                  Text(item, style: TextStyle(fontSize: normalTitle, color: normalTextColor, fontFamily: 'RobotoRegular')),
                ],
              );
            }).toList()
      ),
    );
  }
}