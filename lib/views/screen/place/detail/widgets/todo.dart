import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/place/detail/TravelGuideScreen.dart';

class Todo extends StatelessWidget {
const Todo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SliverPadding(
      padding: const EdgeInsets.all(mainPadding),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: mainPadding,
          crossAxisSpacing: mainPadding,
          childAspectRatio: 1.6,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            var item = listToDo[index];
            return GestureDetector(
              onTap: () {Get.to(TravelGuideScreen());},
              child: Container(
                decoration: BoxDecoration(
                  color: item["color"],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 0)
                    )
                  ]
                ),
                child: Padding(
                  padding: EdgeInsets.all(mainPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Icon(item["icon"], color: mainTextColor, size: item["size"]),
                      ),
                      Text(item["title"], style: TextStyle(fontSize: normalTitle, color: whiteColor, fontFamily: 'RobotoMedium'))
                    ],
                  ),
                ),
              )
            );
          },
          childCount: listToDo.length,
        ),
      )
    );
  }
}