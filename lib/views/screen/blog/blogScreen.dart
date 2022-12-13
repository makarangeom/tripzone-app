import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/views/screen/engagement/engagement.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({ Key? key }) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}
class _BlogScreenState extends State<BlogScreen> with WidgetsBindingObserver {
  late Timer timer;
  int count = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver((this));
    timer = Timer.periodic(Duration(seconds: 1), (tm) {
      setState(() {
        count += 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    WidgetsBinding.instance.addObserver((this));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print({'********************: Resumed'});
    }else if(state == AppLifecycleState.inactive){
      print({'********************: Inactive'});
    }else if(state == AppLifecycleState.detached){
      print({'********************: Detached'});
    }else if(state == AppLifecycleState.paused){
      print({'********************: Paused'});
    }
  }

  @override
  void deactivate () {
    super.deactivate();
    WidgetsBinding.instance.addObserver((this));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Center(
        child: GestureDetector(
          onTap: () => Get.to(Engagement()),
          child: Text("$count", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        )
      ),
    );
  }
}