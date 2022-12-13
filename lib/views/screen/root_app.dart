import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/screen/blog/blogScreen.dart';
import 'package:tripzone/views/screen/event/EventScreen.dart';
import 'package:tripzone/views/screen/explore/ExploreScreen.dart';
import 'package:tripzone/views/screen/home/homeScreen.dart';
import 'package:tripzone/views/screen/setting/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RootApp extends StatefulWidget {
    const RootApp({ Key? key }) : super(key: key);

    @override
    _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  bool _selectTabs = false;
  int activeTabIndex = 0;
  List listMenu = [
      {
          "name": 'Home',
          "icon": Icons.home,
          "page": const HomeScreen(),
      },{
          "name": 'Explore',
          "icon": Ionicons.search,
          "page": const ExploreScreen(),
      },{
          "name": 'Event',
          "icon": CommunityMaterialIcons.calendar_star,
          "page": const EventScreen()
      },{
          "name": 'Blog',
          "icon": Icons.post_add,
          "page": const BlogScreen(),
      },{
          "name": 'Setting',
          "icon": Ionicons.settings_sharp,
          "page": const SettingScreen(),
      },
  ];

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      print('=====================');
  }

  //====== set animation=====
  late final AnimationController _controller = AnimationController(
      duration: Duration(milliseconds: ANIMATED_BODY_MS),
      vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
  );

  void onPageChanged(int index) {
      if (index == activeTabIndex) return;
          _controller.reset();
          setState(() {
          activeTabIndex = index;
      });
      _controller.forward();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  Widget displayScreen() {
    return IndexedStack(
      index: activeTabIndex,
      children: List.generate(
        listMenu.length, 
        (index) => listMenu[index]["page"]
      )
    );
  }

  Widget bottomTabBar() {
    return Container(
      width: Size.infinite.width,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: mainPadding),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 0)
          )
        ]
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)), 
          depth: 8,
          lightSource: LightSource.top,
          color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:List.generate(
            listMenu.length,
            (index) => GestureDetector(
              onTap: () {
                // onPageChanged(index);
                setState(() {
                  _selectTabs = true;
                  activeTabIndex = index;
                  _pageController.animateToPage(activeTabIndex, duration: const Duration(milliseconds: 15), curve: Curves.easeInOut);
                });
              },
              child: 
                index == activeTabIndex?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(listMenu[index]["icon"], size: 25, color:  btnBgrColor),
                      NeumorphicText(
                        listMenu[index]["name"].toUpperCase(),
                        style: NeumorphicStyle(
                          depth: 4,  //customize depth here
                          color: btnBgrColor
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: smallTitle, fontFamily: 'RobotoBold'
                        ),
                      ),
                    ],
                  )
                :
                  Icon(listMenu[index]["icon"], size: 23, color: normalTextColor)
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value){
          onPageChanged(value);
          setState(() {
            if(_selectTabs){
              _selectTabs = false;
            }else{
              activeTabIndex = value;
              _pageController.animateToPage(activeTabIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            }
          });
        },
        children:  [
          HomeScreen(),
          ExploreScreen(),
          EventScreen(),
          BlogScreen(),
          SettingScreen()
        ],
      ),
      floatingActionButton: bottomTabBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}