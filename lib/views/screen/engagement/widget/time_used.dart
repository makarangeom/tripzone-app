import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeUsed extends StatefulWidget {
    const TimeUsed({ Key? key }) : super(key: key);
    

    @override
    _TimeUsedState createState() => _TimeUsedState();
}

class _TimeUsedState extends State<TimeUsed> {
    Duration duration = Duration();
    Timer? timer;
    bool countDown = true;
    
    void startTimer() {
        timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    }

    void addTime() {
        final addSeconds = 1;
        setState(() {
            final seconds = duration.inSeconds + addSeconds;
            if (seconds < 0) {
                timer?.cancel();
            } else {
                duration = Duration(seconds: seconds);
            }
        });
    }

    @override
    void initState() {
        startTimer();
        super.initState();
    }
    
    @override
    Widget build(BuildContext context) {
        String twoDigits(int n) => n.toString().padLeft(2, '0');
        final hours = twoDigits(duration.inHours);
        final minutes = twoDigits(duration.inMinutes.remainder(60));
        final seconds = twoDigits(duration.inSeconds.remainder(60));
        return Container(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Column(
                children: [
                    Text(hours + ':' + minutes + ':' + seconds, style: TextStyle(fontSize: 48, color: Colors.black, fontWeight: FontWeight.bold)),
                    Text('Screen time today', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                ],
            ),
          ),
        );
    }
}