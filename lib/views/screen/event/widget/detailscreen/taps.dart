import 'package:flutter/material.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/screen/event/widget/detailscreen/including.dart';
import 'package:tripzone/views/screen/event/widget/detailscreen/overview.dart';
import 'package:tripzone/views/screen/event/widget/detailscreen/steps.dart';

class Taps extends StatefulWidget {
  const Taps({ Key? key }) : super(key: key);

  @override
  _TapsState createState() => _TapsState();
}

class _TapsState extends State<Taps> {
  final List<String> listItem = [
    'Overview', 'Steps', 'Including'
  ];
  String activeMenu = 'Overview';

  handleClickTabsButton (String item) {
    setState(() {
      activeMenu = item;
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          children: listItem.map((item) {
              var index = listItem.indexOf(item);
              return GestureDetector(
                onTap: () {handleClickTabsButton(item);},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: mainPadding*2),
                      child: Text(item, style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                    ),
                    SizedBox(height: 3),
                    item == activeMenu?
                      Container(
                        width: 5.5*item.length.toDouble(),
                        height: 2,
                        decoration: BoxDecoration(
                          color: mainTextColor,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      )
                    :SizedBox(),
                  ],
                )
              );
            }).toList()
        ),
        SizedBox(height: mainPadding),
        activeMenu=='Overview'?
          Overview()
        :activeMenu=='Steps'?
          Steps()
        :Including()
      ],
    );
  }
}