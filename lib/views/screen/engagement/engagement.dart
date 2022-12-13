import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripzone/constants/controller.dart';
import 'package:tripzone/controllers/device_controller.dart';
import 'package:tripzone/services/firebase_services.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/views/screen/engagement/widget/list_engagement.dart';
import 'package:tripzone/views/screen/engagement/widget/time_used.dart';
import 'package:tripzone/views/screen/engagement/widget/weather.dart';
import 'package:intl/intl.dart';

class Engagement extends StatefulWidget {
    const Engagement({ Key? key }) : super(key: key);

    @override
    _EngagementState createState() => _EngagementState();
}

class _EngagementState extends State<Engagement> {
  String deviceName ='';
  String deviceVersion ='';
  String identifier= '';
  DateTime nowDateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    // print(deviceController.DeviceInfo());
    super.initState();
    // _deviceDetails();
    
    // DeviceController.instance.openApp = nowDateTime;
    // Future.delayed(const Duration(seconds: 2), (){
    //   getDevice();
    //   storeDeviceInstalled();
    // });
  }

    storeAppPickUp() async {
      print('------------------');
      Duration diff = DateTime.now().difference(DeviceController.instance.openApp);
      print({'-----------&&&&&&&&&&&&&&&&&&&&-----------', diff.inMinutes});
      print({DeviceController.instance.openApp, '=================', nowDateTime});
      print({DateTime.now()});
      // await Future.delayed(const Duration(seconds: 2), (){
        dynamic result = FirebaseServices().AppPickupCounted(identifier, deviceName, diff.inMinutes);
      // });
    }

    getDevice() async {
      await FirebaseServices().getDeviceInstalled(identifier);
    }

    storeDeviceInstalled() async {
      print('--------dddddd----------');
      dynamic result = await FirebaseServices().appInstalled(identifier, deviceName);
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

    /// Function For Exit The Application
    ActionExitApp({required bool status}) {
      if(status){
        storeAppPickUp();
        Future.delayed(const Duration(seconds: 1), (){
          Navigator.of(context).pop(status);
          exit(0);
        });
      }else{
        // storeAppPickUp();
        DeviceController.instance.getInfo('b12ee554eeaeecce');
        var date = deviceController.SinceDate.toDate();
        print({'========list===========', date});
        var outputFormat = DateFormat('dd/MM/yyyy');
        var outputDate = outputFormat.format(date);

        print({'outputDate========', outputDate});
        print(outputDate);
        Navigator.of(context).pop(status);
      }
    }

    @override
    Widget build(BuildContext context) {
      return WillPopScope( 
          onWillPop: showExitPopup,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TimeUsed(),
                  SizedBox(height: 40),
                  Weather(),
                  SizedBox(height: 15),
                  Expanded(
                      child: ListEngagement()
                  )
                ],
            ),
          )
        )
      );
    }
}