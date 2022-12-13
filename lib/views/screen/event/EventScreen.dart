import 'package:community_material_icon/community_material_icon.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/event/widget/each_item.dart';
import 'package:tripzone/views/screen/explore/FilterResortScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class EventScreen extends StatefulWidget {
    const EventScreen({ Key? key }) : super(key: key);

    @override
    _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  String categoryName = 'All';
  final double searchHeight = 55;
  
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          color: whiteColor,
          child: CustomScrollView(
            slivers: [
              ///// Display Block Button Search And Filter 
              SliverAppBar(
                backgroundColor: whiteColor,
                expandedHeight: 55,
                collapsedHeight: 80,
                floating: true,
                flexibleSpace: Container(
                  padding: EdgeInsets.only(top: 5, left: mainPadding, right: mainPadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: searchHeight,
                          padding: EdgeInsets.only(left: mainPadding, top: mainPadding/2, bottom: mainPadding/2, right: mainPadding/2),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: mainTextColor.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(2, 2)
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Ionicons.search, color: normalTextColor),
                                  SizedBox(width: mainPadding),
                                  Text('Search...', style: TextStyle(color: normalTextColor, fontSize: normalTitle, fontFamily: 'RobotoMedium')),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {Get.to(FilterResortScreen());},
                                child: Container(
                                  height: searchHeight - mainPadding,
                                  width: searchHeight - mainPadding,
                                  margin: EdgeInsets.only(left: mainPadding),
                                  padding: EdgeInsets.all(mainPadding/1.5),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: mainTextColor.withOpacity(0.3),
                                        blurRadius: 4,
                                        offset: const Offset(1, 1)
                                      ),
                                    ],
                                  ),
                                  child: Image.asset('assets/images/icons/filter.png', height: 10, fit: BoxFit.contain),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: searchHeight,
                        width: searchHeight,
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
                        child: Icon(CommunityMaterialIcons.calendar_plus, size: 26, color: mainTextColor),
                      )
                    ],
                  ),
                ),
              ),
              ///// Display Block Categories
              SliverAppBar(
                backgroundColor: whiteColor,
                expandedHeight: 55,
                collapsedHeight: 63,
                floating: true,
                pinned: true,
                flexibleSpace: Container(
                  padding: EdgeInsets.only(left: mainPadding),
                  height: 70,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: mainTextColor.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(1, 1)
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: listCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      dynamic item = listCategories[index];
                      dynamic list = listCategories[index];
                      return(
                        GestureDetector(
                          onTap: () => setState(() {
                            categoryName = item['name'];
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 3, color: item['name']==categoryName?mainTextColor:whiteColor),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(item['img'], height: 30, fit: BoxFit.contain),
                                Text(item['name'], style: TextStyle(color: mainTextColor, fontSize: smallTitle, fontFamily: item['name']==categoryName?'RobotoBold':'RobotoRegular')),
                              ]
                            )
                          )
                        )
                      );
                    }, 
                    separatorBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.symmetric(horizontal: mainPadding, vertical: mainPadding))
                  )
                )
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: mainPadding*2),
              ),
              ///// Display Block List Resorts
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  dynamic item = listResorts[index];
                  return EachItem(item: item);
                },
                childCount: listResorts.length),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 65),
              ),
            ]
          )
        ),
      ),
    );
  }
}