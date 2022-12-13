import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:flutter/material.dart';

class TweenButton extends StatelessWidget {
    const TweenButton({ Key? key, this.firstAction }) : super(key: key);
    final GestureTapCallback? firstAction;

    @override
    Widget build(BuildContext context){
        double screenWidth = MediaQuery.of(context).size.width;
        return Container(
            width: Size.infinite.width,
            // height: 50,
            padding: EdgeInsets.all(mainPadding),
            decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 0)
                    )
                ]
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Expanded(
                        child: GestureDetector(
                            child: Container(
                                height: btnHeight,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: mainPadding+5, vertical: mainPadding/2),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                        BoxShadow(
                                            color: btnBgrColor.withOpacity(0.3),
                                            blurRadius: 5,
                                            offset: const Offset(1, 1)
                                        ),
                                    ],
                                ),
                                child: Text('reset'.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontSize: smallTitle, color: whiteColor, fontFamily: 'RobotoBold')),
                            )
                        ),
                    ),
                    SizedBox(width: mainPadding),
                    Expanded(
                        child: GestureDetector(
                            onTap: firstAction,
                            child: Container(
                                height: btnHeight,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: mainPadding+5, vertical: mainPadding/2),
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
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                        Text('83'.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontSize: subTitle, color: whiteColor, height: 1.2, fontFamily: 'RobotoBold')),
                                        Text(' ' + 'results'.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontSize: smallTitle, color: whiteColor, fontFamily: 'RobotoBold')),
                                    ],
                                ),
                            )
                        ),
                    ),
                ]
            ),
        );
    }
}