import 'package:community_material_icon/community_material_icon.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/province/widget/itemProvince.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ProvinceScreen extends StatelessWidget {
    const ProvinceScreen({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context){
        listProvinces.removeAt(0); /// Remove first index of array object
        return Scaffold(
            backgroundColor: whiteColor,
            body: SafeArea(
                child: Container(
                    child: CustomScrollView(
                        slivers: [
                            // Block Display Header Back Button And Search
                            SliverAppBar(
                                automaticallyImplyLeading: false,
                                backgroundColor: whiteColor,
                                expandedHeight: 45,
                                collapsedHeight: 140,
                                floating: true,
                                flexibleSpace: Container(
                                    child: Column(
                                        children: [
                                            // Display Back Button And Title
                                            SizedBox(
                                                child: Row(
                                                    children: [
                                                        GestureDetector(
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
                                                        ),
                                                        SizedBox(width: mainPadding),
                                                        Text('Provinces', style: TextStyle(fontSize: bigTitle, color: mainTextColor, fontFamily: 'RobotoBold'))
                                                    ],
                                                ),
                                            ),
                                            // Display Search TextField
                                            Container(
                                                height: 45,
                                                margin: EdgeInsets.only(left: mainPadding, right: mainPadding, top: mainPadding*2),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                        BoxShadow(
                                                            color: mainTextColor.withOpacity(0.2),
                                                            blurRadius: 4,
                                                            offset: const Offset(0, 0)
                                                        ),
                                                    ],
                                                ),
                                                child: TextField(
                                                    style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoBold'),
                                                    decoration: InputDecoration(
                                                        fillColor: Colors.white,
		                                                filled: true,
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            borderSide: BorderSide(
                                                                width: 0, 
                                                                style: BorderStyle.none,
                                                            ),
                                                        ),
                                                        contentPadding: EdgeInsets.only(
                                                            bottom: 45 / 2, // HERE THE IMPORTANT PART
                                                            left: mainPadding
                                                        ),
                                                        hintText: 'Search...',
                                                        hintStyle: TextStyle(fontSize: normalTitle, color: normalTextColor, fontFamily: 'RobotoMedium'),
                                                        suffixIcon: Padding(
                                                            padding: const EdgeInsetsDirectional.only(end: 10.0),
                                                            child: Icon(Ionicons.search, size: 24, color: normalTextColor), // myIcon is a 48px-wide widget.
                                                        )
                                                    ),
                                                ),
                                            )
                                        ],
                                    ),
                                )
                            ),
                            // Block Display List Items
                            SliverList(
                                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                                    dynamic item = listProvinces[index];
                                    return Container(
                                        padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                        child: ItemProvince(item: item),
                                    );
                                },
                                childCount: listProvinces.length),
                            ),
                        ],
                    )
                ),
            ),
        );
    }
}