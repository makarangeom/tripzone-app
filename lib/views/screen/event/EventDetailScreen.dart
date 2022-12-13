import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/screen/event/widget/detailscreen/banner_slider.dart';
import 'package:tripzone/views/screen/event/widget/detailscreen/bottom_action.dart';
import 'package:tripzone/views/screen/event/widget/detailscreen/taps.dart';
import 'package:tripzone/views/widgets/custom_back_button.dart';
import 'package:tripzone/views/widgets/tween_button.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({ Key? key, this.item }) : super(key: key);
  final item;

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final double sliderHeight = 330;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: sliderHeight-50,
            floating: true,
            pinned: true,
            /// For Back Button
            leading: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
                child: Row(
                children: [
                  CustomBackButton()
                ],
              ),
            ),
            /// For Right Actions
            actions: [
              Icon(CommunityMaterialIcons.map_legend, size: 25),
              SizedBox(width: mainPadding),
              Icon(CommunityMaterialIcons.share_variant, size: 25),
              SizedBox(width: mainPadding)
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                children: [
                  Positioned(
                    child: BannerSlider(sliderHeight: sliderHeight)
                  ),
                  Positioned(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    ),
                    bottom: -1,
                    left: 0,
                    right: 0,
                  ),
                ],
              )
            )
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(left: mainPadding, right: mainPadding, bottom: mainPadding),
                height: 1000,
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trip at TaTai Waterfall', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '\$15',
                                style: TextStyle(fontSize: mainTitle+2, color: btnBgrColor, fontFamily: 'RobotoBold'),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '/' + 'person',
                                    style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular')
                                  ),
                                ]
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(CommunityMaterialIcons.clock_outline, size: 16),
                                    SizedBox(width: 5),
                                    RichText(
                                      text: TextSpan(
                                        text: '2',
                                        style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoBold'),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ' + 'days' + '/',
                                            style: TextStyle(fontFamily: 'RobotoRegular')
                                          ),
                                          TextSpan(
                                            text: '1',
                                            style: TextStyle(fontFamily: 'RobotoBold')
                                          ),
                                          TextSpan(
                                            text: ' ' + 'night',
                                            style: TextStyle(fontFamily: 'RobotoRegular')
                                          ),
                                        ]
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: mainPadding*2),
                                Row(
                                  children: [
                                    Icon(Icons.directions, size: 16),
                                    SizedBox(width: 3),
                                    Text('Koh Kong, Cambodia', style: TextStyle(fontSize: normalTitle, color: mainTextColor, height: 1.5, fontFamily: 'RobotoRegular'))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: mainPadding),
                    Taps(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: BottomAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}