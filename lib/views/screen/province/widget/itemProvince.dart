import 'package:community_material_icon/community_material_icon.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:flutter/material.dart';

class ItemProvince extends StatelessWidget {
    const ItemProvince({ Key? key, required this.item }) : super(key: key);
    final item;

    @override
    Widget build(BuildContext context){
        return Container(
            width: 1000.0,
            height: 180,
            padding: EdgeInsets.all(mainPadding),
            margin: EdgeInsets.only(bottom: mainPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mainBorderRadius),
                color: mainTextColor,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        mainTextColor.withOpacity(0.8), 
                        BlendMode.dstATop
                    ),
                    image: NetworkImage(item['img']),
                ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    // Block Results and Button
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            // Text(item['name'], style: TextStyle(fontSize: subTitle, color: whiteColor, height: 1.5, fontFamily: 'RobotoBold')),
                            RichText(
                                text: TextSpan(
                                    text: '103' + ' ',
                                    style: TextStyle(fontSize: subTitle, color: whiteColor, fontFamily: 'RobotoBold'),
                                    children: <TextSpan>[
                                        TextSpan(
                                            text: 'Places',
                                            style: TextStyle(fontSize: normalTitle, fontFamily: 'RobotoRegular')
                                        ),
                                    ]
                                ),
                            ),
                            Container(height: mainPadding-10),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: mainPadding-5, vertical: mainPadding-10),
                                decoration: BoxDecoration(
                                    color: btnBgrColor,
                                    boxShadow: [
                                        BoxShadow(
                                            color: mainTextColor.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: const Offset(0, 0)
                                        ),
                                    ],
                                    borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        Text('Visit Now', style: TextStyle(fontSize: smallTitle, color: whiteColor, fontFamily: 'RobotoBold')),
                                        SizedBox(
                                            width: 5,
                                        ),
                                        Icon(CommunityMaterialIcons.arrow_right_circle_outline, size: 14, color: whiteColor),
                                    ],
                                ),
                            ),
                        ],
                    ),
                    // Block Title And Area
                    Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(item['name'], style: TextStyle(fontSize: subTitle, color: whiteColor, height: 1.5, fontFamily: 'RobotoBold')),
                            Row(
                                children: [
                                    Text('11,702' + ' ', style: TextStyle(fontSize: smallTitle, color: whiteColor, fontFamily: 'RobotoMedium')),
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text('Km', style: TextStyle(fontSize: smallTitle, color: whiteColor, fontFamily: 'RobotoMedium')),
                                            Text('2', style: TextStyle(fontSize: smallTitle-2, color: whiteColor, fontFamily: 'RobotoMedium')),
                                        ],
                                        
                                    ),
                                ],
                            )
                        ],
                    )
                ],
            ),
        );
    }
}