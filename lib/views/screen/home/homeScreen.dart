import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tripzone/services/firebase_services.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/home/carousel.dart';
import 'package:tripzone/views/screen/province/SearchableScreen.dart';
import 'package:tripzone/views/widgets/itemResortHorizontal.dart';
import 'package:tripzone/views/widgets/ItemPlaceVertical.dart';
import 'package:tripzone/views/widgets/main_block_title.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({ Key? key }) : super(key: key);

    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int activePage = 1;
  String deviceName ='';
  String deviceVersion ='';
  String identifier= '';

  @override
  void initState() {
    super.initState();
    fetchData();
    _pageController = PageController(viewportFraction: 0.8);
    _deviceDetails();
    // Webservices.fetchProvinceList();
    // Future.delayed(const Duration(seconds: 2), (){
    //   fetchData();
    // });
  }

    fetchData() async {
      print('------------------');
      // await Future.delayed(const Duration(seconds: 2), (){
        // dynamic resutl = FirebaseServices().AppPickupCounted(identifier, deviceName);
      // });
    }

    Future<void>_deviceDetails() async{
      final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
      try {
      if (Platform.isAndroid) {
              var build = await deviceInfoPlugin.androidInfo;
              setState(() {
                  deviceName = build.model;
                  deviceVersion = build.version.toString();
                  identifier = build.androidId;
              });
              //UUID for Android
          } else if (Platform.isIOS) {
              var data = await deviceInfoPlugin.iosInfo;
              setState(() {
                  deviceName = data.name;
                  deviceVersion = data.systemVersion;
                  identifier = data.identifierForVendor;
              });//UUID for iOS
          }
      } on PlatformException {
          print('Failed to get platform version');
      }
    }

    /// Function For Exit The Application
    ActionExitApp({required bool status}) {
      if(status){
        fetchData();
        Future.delayed(const Duration(seconds: 1), (){
          Navigator.of(context).pop(status);
          exit(0);
        });
      }else{
        Navigator.of(context).pop(status);
      }
    }

    /// Popup For Confirm Close The Application
    Future<bool> showExitPopup() async {
        return await showDialog( //show confirm dialogue 
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
                // title: Text('Exit App'),
                content: Text('Are you sure you want to close the application?', style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular')),
                actions:[
                    GestureDetector(
                        onTap: () => ActionExitApp(status: false),
                        child: Text('No'.toUpperCase(), style: TextStyle(fontSize: normalTitle, color: primaryColor, fontFamily: 'RobotoBold')),
                    ),
                    SizedBox(width: mainPadding/2),
                    GestureDetector(
                        onTap: () => ActionExitApp(status: true),
                        child: Text('Yes'.toUpperCase(), style: TextStyle(fontSize: normalTitle, color: btnBgrColor, fontFamily: 'RobotoBold')),
                    ),
                    SizedBox(width: mainPadding/2),
                ],
            ),
        )??false; //if showDialouge had returned null, then return false
    }
    
    @override
    Widget build(BuildContext context) {
        return WillPopScope( 
            onWillPop: showExitPopup,
            child: Container(
                color: whiteColor,
                child: CustomScrollView(
                    slivers: [
                        ///// Display Block Header
                        SliverToBoxAdapter(
                            child: Container(
                                height: 280,
                                decoration: BoxDecoration(
                                    color: mainTextColor,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/images/coconut.png')
                                    ),
                                ),
                                child: Container(
                                    padding: EdgeInsets.only(top: 100, left: 15, right: 15, bottom: 30),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                    Text('Explore', style: TextStyle(color: mainTextColor, fontSize: 30, fontFamily: 'RobotoBold')),
                                                    Text('The Best Trips', style: TextStyle(color: mainTextColor, fontSize: 30, fontFamily: 'RobotoBold'))
                                                ],
                                            ),
                                            ///// Display Search Button
                                            GestureDetector(
                                                onTap: () => Get.to(() => SearchableScreen()),
                                                child: Container(
                                                    height: 45,
                                                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                                    decoration: BoxDecoration(
                                                        color: whiteColor.withOpacity(0.8),
                                                        borderRadius: BorderRadius.circular(50),
                                                        boxShadow: [
                                                            BoxShadow(
                                                                color: mainTextColor.withOpacity(0.1),
                                                                blurRadius: 5,
                                                                offset: const Offset(0, 0)
                                                            ),
                                                        ],
                                                    ),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                            Text('Search...', style: TextStyle(color: normalTextColor, fontSize: 14, fontFamily: 'RobotoMedium')),
                                                            Icon(Ionicons.search, color: normalTextColor)
                                                        ],
                                                    ),
                                                ),
                                            )
                                        ],
                                    ),
                                ),
                            ),
                        ),
                        ///// Display Block Body
                        SliverToBoxAdapter(
                            child: Column(
                                children: [
                                    /// Block Featured Provinced
                                    Carousel(),
                                    Column(
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
                                    /// Block Recently Added
                                    Column(
                                        children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                                child: MainBlockTitle(title: 'Recently Added', subTitle: 'View all'),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(left: mainPadding),
                                                child: ItemResortHorizontal(),
                                            )
                                        ],
                                    ),
                                    /// Block Title Recommended Places
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                        child: MainBlockTitle(title: 'Recommended Places', subTitle: 'View all'),
                                    ),
                                ],
                            ),
                        ),
                        ///// Display Block Body Recommended Places
                        SliverList(
                            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                                dynamic item = listResorts[index];
                                return ItemPlaceVertical(item: item);
                            },
                            childCount: listResorts.length),
                        ),
                        SliverToBoxAdapter(
                            child: Container(height: 65),
                        ),
                    ],
                ),
            ),
        );
    }
}