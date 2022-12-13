import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/widgets/custom_back_button.dart';
import 'package:tripzone/views/widgets/main_block_title.dart';

class SearchableScreen extends StatefulWidget {
  const SearchableScreen({ Key? key }) : super(key: key);

  @override
  _SearchableScreenState createState() => _SearchableScreenState();
}

class _SearchableScreenState extends State<SearchableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Block Display Header Back Button And Search
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              expandedHeight: 45,
              collapsedHeight: 110,
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                      // Display Back Button And Title
                    SizedBox(
                      child: Row(
                        children: [
                          CustomBackButton(),
                          SizedBox(width: mainPadding),
                          Expanded (
                            child: Container(
                              height: btnHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
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
                                    borderRadius: BorderRadius.circular(50.0),
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
                            ),
                          ),
                          SizedBox(width: mainPadding),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mainPadding),
                      child: MainBlockTitle(title: 'Recent search', subTitle: 'See all')
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
                  margin: EdgeInsets.only(bottom: mainPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(CommunityMaterialIcons.clock_outline, size: 26, color: mainTextColor),
                          SizedBox(width: mainPadding),
                          Text('How to be rice without money.', style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular')),
                        ],
                      ),
                      Icon(CommunityMaterialIcons.close, size: 18, color: mainTextColor),
                    ],
                  ),
                );
              },
              childCount: listProvinces.length),
            ),
          ],
        ),
      ),
    );
  }
}