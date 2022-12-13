import 'package:community_material_icon/community_material_icon.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/views/widgets/itemPlaceVertical.dart';

class ResortWithProvinceScreen extends StatefulWidget {
    ResortWithProvinceScreen(this.item, { Key? key }) : super(key: key);
    final item;

    @override
    _ResortWithProvinceScreenState createState() => _ResortWithProvinceScreenState();
}

class _ResortWithProvinceScreenState extends State<ResortWithProvinceScreen> {
    late ScrollController _scrollController;

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
        _scrollController = ScrollController()
        ..addListener(() {
            setState(() {
                // _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
            });
        });
    }

    //----------
    bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
    }

    @override
    Widget build(BuildContext context) {
        final item = widget.item;
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
            backgroundColor: whiteColor,
            body: Container(
                child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                        SliverAppBar(
                            automaticallyImplyLeading: true,
                            backgroundColor: primaryColor,
                            expandedHeight: 200,
                            floating: true,
                            pinned: true,
                            /// For Back Button
                            leading: OverflowBox(
                                maxWidth: double.infinity,
                                maxHeight: double.infinity,
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
                                    ],
                                ),
                            ),
                            /// For Title
                            title: Text('Provinces', style: TextStyle(fontSize: bigTitle, color: whiteColor, fontFamily: 'RobotoBold')),
                            /// For Right Actions
                            actions: [
                                Icon(CommunityMaterialIcons.map_legend, size: 25),
                                SizedBox(width: mainPadding)
                            ],
                            /// For Dynamic Space Bar Like Search Field And Province Desc
                            flexibleSpace: FlexibleSpaceBar(
                                background: Container(
                                    decoration: BoxDecoration(
                                        color: mainTextColor,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                mainTextColor.withOpacity(0.8), 
                                                BlendMode.dstATop
                                            ),
                                            image: NetworkImage(item['img'])
                                        ),
                                    ),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                            /// Display Search TextField
                                            Container(
                                                padding: EdgeInsets.only(bottom: mainPadding*2),
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                        Text(item['name'], style: TextStyle(fontSize: mainTitle, color: whiteColor, height: 1.5, fontFamily: 'RobotoBold')),
                                                        Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                                Text('11,702' + ' ', style: TextStyle(fontSize: normalTitle, color: whiteColor, fontFamily: 'RobotoMedium')),
                                                                Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                        Text('Km', style: TextStyle(fontSize: normalTitle, color: whiteColor, fontFamily: 'RobotoMedium')),
                                                                        Text('2', style: TextStyle(fontSize: smallTitle-2, color: whiteColor, fontFamily: 'RobotoMedium')),
                                                                    ],
                                                                ),
                                                            ],
                                                        )
                                                    ],
                                                ),
                                            ),
                                            /// Display Search TextField
                                            Stack(
                                                children: [
                                                    Container(
                                                        color: whiteColor,
                                                        height: btnHeight/2,
                                                        margin: EdgeInsets.only(top: (btnHeight/2)+5),
                                                    ),
                                                    Container(
                                                        height: btnHeight,
                                                        margin: EdgeInsets.only(left: mainPadding, right: mainPadding, bottom: 5),
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
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    borderSide: BorderSide(
                                                                        width: 0, 
                                                                        style: BorderStyle.none,
                                                                    ),
                                                                ),
                                                                contentPadding: EdgeInsets.only(bottom: 45 / 2, left: mainPadding+5),
                                                                hintText: 'Search...',
                                                                hintStyle: TextStyle(fontSize: normalTitle, color: normalTextColor, fontFamily: 'RobotoMedium'),
                                                                suffixIcon: Padding(
                                                                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                                                                    child: Icon(Ionicons.search, size: 24, color: normalTextColor), // myIcon is a 48px-wide widget.
                                                                )
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            )
                                        ],
                                    ),
                                )
                            ),
                        ),
                        // Spacing Between Block
                        SliverToBoxAdapter(
                            child: SizedBox(height: mainPadding*2),
                        ),
                        // Block Display List Items
                        SliverList(
                            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                                dynamic item = listResorts[index];
                                return ItemPlaceVertical(item: item);
                            },
                            childCount: listResorts.length),
                        ),
                    ],
                ),
            ),
        );
    }
}