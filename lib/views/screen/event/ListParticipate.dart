import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/event/widget/each_item.dart';
import 'package:tripzone/views/screen/event/widget/item_participate.dart';
import 'package:tripzone/views/widgets/custom_back_button.dart';

class ListParticipate extends StatefulWidget {
  const ListParticipate({ Key? key }) : super(key: key);

  @override
  _ListParticipateState createState() => _ListParticipateState();
}

class _ListParticipateState extends State<ListParticipate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: whiteColor,
              automaticallyImplyLeading: false,
              // collapsedHeight: 60,
              floating: true,
              pinned: false,
              /// For Back Button  
              flexibleSpace: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomBackButton(),
                    SizedBox(width: mainPadding),
                    Text('Participats', style: TextStyle(fontSize: bigTitle, color: mainTextColor, fontFamily: 'RobotoBold'))
                  ],
                ),
              ),
            ),

            ///// Display Block List Item
            SliverPadding(
              padding: EdgeInsets.all(mainPadding),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  dynamic item = listCategories[index];
                  return ItemParticipate();
                },
                childCount: listCategories.length),
              ),
            )
          ],
        ),
      )
    );
  }
}