import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/screen/place/detail/widgets/description.dart';
import 'package:tripzone/views/screen/place/detail/widgets/todo.dart';
import 'package:tripzone/views/screen/place/widget/banner_slider.dart';
import 'package:tripzone/views/widgets/custom_back_button.dart';
import 'package:tripzone/views/widgets/itemResortHorizontal.dart';
import 'package:tripzone/views/widgets/main_block_title.dart';

class PlaceDetailScreen extends StatelessWidget {
const PlaceDetailScreen({ Key? key }) : super(key: key);
  final double sliderHeight = 340;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: sliderHeight-43,
            floating: false,
            // backgroundColor: whiteColor,
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
              background: Container(
                color: whiteColor,
                child: Stack(
                  children: [
                    Positioned(
                      child: BannerSlider(sliderHeight: sliderHeight)
                    ),
                    Positioned(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: whiteColor,
                        ),
                      ),
                      bottom: -1,
                      left: 0,
                      right: 0,
                    ),
                  ],
                ),
              )
            )
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Description(),
                    SizedBox(height: mainPadding),
                    // Display video
                    Image.asset(
                      'assets/images/koh_sdach.jpg',
                      height: 250,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: mainPadding),
                  ],
                ),
              ),
            ]),
          ),
          Todo(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: mainPadding, right: mainPadding, top: mainPadding),
                  child: MainBlockTitle(title: 'Popular Places', subTitle: 'View all'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: mainPadding),
                  child: ItemResortHorizontal(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
    size.width / 2, 
    size.height,
    size.width,
    size.height
  );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}