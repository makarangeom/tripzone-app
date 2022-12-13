import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:flutter/material.dart';

class Tags extends StatefulWidget {
    const Tags(this.index, this.displayTags, this.element, { Key? key, this.onTap, this.onTap2 }) : super(key: key);
    final int index;
    final int displayTags;
    final element;
    final GestureTapCallback? onTap;
    final GestureTapCallback? onTap2;

    @override
    _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
    @override
    Widget build(BuildContext context) {
        int index = widget.index;
        int displayTags = widget.displayTags;
        final element = widget.element;
        GestureTapCallback? onTap = widget.onTap;
        GestureTapCallback? onTap2 = widget.onTap2;

        return Container(
            child: index<=displayTags?
                GestureDetector(
                    onTap: onTap,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: mainPadding+5, vertical: mainPadding/2),
                        decoration: BoxDecoration(
                            color: element['status']=='active'?primaryColor:bgrNormalBtn.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: whiteColor),
                            boxShadow: [
                                BoxShadow(
                                    color: element['status']=='active'?primaryColor:bgrNormalBtn.withOpacity(0.3),
                                    blurRadius: 5,
                                    offset: const Offset(1, 1)
                                ),
                            ],
                        ),
                        child: Text(element['name'].toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: smallTitle, color: element['status']=='active'?whiteColor:mainTextColor, fontFamily: element['status']=='active'?'RobotoBold':'RobotoRegular')),
                    )
                ):index<=displayTags+1?
                    GestureDetector(
                        onTap: onTap2,
                        child: Container(
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
                            child: Text('More', textAlign: TextAlign.center, style: TextStyle(fontSize: smallTitle, color: whiteColor, fontFamily: 'RobotoRegular')),
                        )
                    ):SizedBox()
    
        );
    }
}