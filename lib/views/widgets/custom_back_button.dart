import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';

class CustomBackButton extends StatelessWidget {
const CustomBackButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){Get.back();},
      child: Container(
        height: btnHeight,
        width: btnHeight,
        margin: EdgeInsets.only(left: mainPadding),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: mainTextColor.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(1, 1)
            ),
          ],
        ),
        child: Icon(CommunityMaterialIcons.arrow_left, size: 26, color: mainTextColor),
      )
    );
  }
}