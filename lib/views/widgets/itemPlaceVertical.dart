import 'package:community_material_icon/community_material_icon.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/widgets/main_block_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ItemPlaceVertical extends StatelessWidget {
ItemPlaceVertical({ Key? key, required this.item}) : super(key: key);
  final item;

  @override
  Widget build(BuildContext context){
    return Container(
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
          Hero(
            tag: 'imageHero',
            child: Container(
              height: 180,
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
                  image: AssetImage(item['img']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                    Text(item['name'], style: TextStyle(fontSize: titleResort, color: mainTextColor, fontFamily: 'RobotoBold')),
                    Row(
                      children: [
                        Icon(Icons.star_rounded, size: 17, color: btnBgrColor),
                        Text('(4.5)', style: TextStyle(fontSize: smallTitle, color: mainTextColor, fontFamily: 'RobotoRegular'))
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin, size: 16),
                        SizedBox(width: 3),
                        RichText(
                          text: TextSpan(
                            text: '11,702',
                            style: TextStyle(fontSize: smallTitle, color: mainTextColor, fontFamily: 'RobotoRegular'),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ' + 'km away',
                                style: TextStyle(fontSize: smallTitle, color: normalTextColor)
                              ),
                            ]
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 1.5),
                    Row(
                      children: [
                        Icon(Icons.directions, size: 16),
                        SizedBox(width: 3),
                        Text('Koh Kong, Cambodia', style: TextStyle(fontSize: smallTitle, color: mainTextColor, height: 1.5, fontFamily: 'RobotoRegular'))
                      ],
                    ),
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}