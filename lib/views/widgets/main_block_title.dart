import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:flutter/material.dart';

class MainBlockTitle extends StatelessWidget {
const MainBlockTitle({ Key? key, required this.subTitle, this.title = '', this.onTap }) : super(key: key);
    final String subTitle;
    final String title;
    final GestureTapCallback? onTap;

    @override
    Widget build(BuildContext context){
        return Container(
            padding: EdgeInsets.symmetric(vertical: mainPadding),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text(title, style: TextStyle(fontSize: mainTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                    GestureDetector(
                        onTap: onTap,
                        child: Text(subTitle, style: TextStyle(fontSize: normalTitle, color: normalTextColor, fontFamily: 'RobotoMedium')),
                    )
                ],
            )
        );
    }
}