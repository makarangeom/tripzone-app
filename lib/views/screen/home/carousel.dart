import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/province/ProvinceScreen.dart';
import 'package:tripzone/views/screen/province/ResortWithProvinceScreen.dart';
import 'package:tripzone/views/widgets/main_block_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carousel extends StatelessWidget {
Carousel({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                    child: MainBlockTitle(title: 'Featured Provinces', subTitle: 'View all', onTap: () {Get.to(ProvinceScreen());}),
                ),
                Container(
                    child: CarouselSlider(
                        options: CarouselOptions(
                            aspectRatio: 2.6,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            initialPage: 1,
                            autoPlay: true,
                            // viewportFraction: 1.0 // full width
                            // enlargeStrategy: CenterPageEnlargeStrategy.height, // space between each item
                        ),
                        items: listProvinces.map((item) => GestureDetector(
                          onTap: () {Get.to(ResortWithProvinceScreen(item));},
                          child: Hero(
                            tag: 'imageHero',
                            child: Container(
                              width: 1000.0,
                              padding: EdgeInsets.all(mainPadding),
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
                              ),
                            )
                          )
                        )).toList()
                    )
                )
            ],
        );
    }
}