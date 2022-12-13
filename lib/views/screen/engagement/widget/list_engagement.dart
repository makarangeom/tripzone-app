import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripzone/constants/controller.dart';
import 'package:tripzone/controllers/device_controller.dart';


class ListEngagement extends StatefulWidget {
  const ListEngagement({ Key? key }) : super(key: key);

  @override
  _ListEngagementState createState() => _ListEngagementState();
}

class _ListEngagementState extends State<ListEngagement> {
    String newHour = '0';
    String newMin = '0';
    String deviceID = 'b12ee554eeaeecce';
    DateTime sinceDate = DateTime.now();
    var outputFormat = DateFormat('dd/MM/yyyy');
    Timestamp userPhotos = Timestamp(1658819126, 384000000);
    int appPickup = 0;
    int longestScreen = 0;
    num totalMinute = 0;
    List listData = [
        {
            "title": "Install Since",
            "time": "21/Jul/2022",
            "type": "date",
            "img": "https://cdn-icons-png.flaticon.com/512/398/398890.png?w=740&t=st=1658314216~exp=1658314816~hmac=761527c766c283dddd1c3b55bc8c15ec14a28d1d09dee6e0311b39e671d01fd8",
        },{
            "title": "Average use",
            "time": 10,
            "type": "minute",
            "img": "https://cdn-icons-png.flaticon.com/512/35/35422.png"
        },{
            "title": "App pickups",
            "time": 5,
            "type": "pickup",
            "img": "https://cdn-icons-png.flaticon.com/512/41/41599.png?w=740"
        },{
            "title": "Longest screen",
            "time": 130,
            "type": "time",
            "img": "https://cdn-icons-png.flaticon.com/512/1093/1093289.png?w=740"
        },{
            "title": "First pickup",
            "time": 10,
            "type": "hour",
            "img": "https://cdn-icons-png.flaticon.com/512/1093/1093288.png?w=740"
        },{
            "title": "Last drop-off",
            "time": 10,
            "type": "hour",
            "img": "https://cdn-icons-png.flaticon.com/512/1093/1093286.png?w=740"
        }
    ];

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDateAppInstalled();
    getAppPickup();
    Future.delayed(const Duration(seconds: 5), (){
    });
  }

  Future<void> getDateAppInstalled() async {
    await FirebaseFirestore.instance.collection('Testing').doc(deviceID).snapshots().listen((event) {
      print(event['sinceAt']);
      var dateTimeStamp = event.get("sinceAt");
      setState(() {
        userPhotos = dateTimeStamp;
        print(dateTimeStamp);
      });
    });
  }

  Future<void> getAppPickup() async {
    await FirebaseFirestore.instance.collection('appPickup').where("deviceID", isEqualTo: deviceID).snapshots()
    .listen((data) => {
      data.docs.map((doc) => {
        totalMinute += doc['time'],
        if(doc['time'] > longestScreen){
          longestScreen = doc['time']
        }
      }).toList(),
      setState(() {
        appPickup = data.docs.length;
      })
    });
  }

    getTimeString(int value) {
      final int hour = value ~/ 60;
      final int minutes = value % 60;
      newHour = hour.toString().padLeft(2, "0");
      newMin = minutes.toString().padLeft(2, "0");
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2.1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15
                ),
                itemCount: listData.length,
                itemBuilder: (BuildContext ctx, index) {
                    listData[index]["type"]=='date'?'':getTimeString(longestScreen);
                    String formattedDate = DateFormat('h:mm a').format(DateTime.now());
                    return GestureDetector(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 4,
                                        offset: const Offset(0, 0)
                                    ),
                                ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(listData[index]["title"], style: TextStyle(fontSize: 14, color: Colors.black)),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                            listData[index]["type"]=='date'?
                                                Text(outputFormat.format(userPhotos.toDate()), style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold))
                                            :listData[index]["type"]=='hour'?
                                                Text(formattedDate.toString(), style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))
                                            :listData[index]["type"]=='minute'?
                                                Text((totalMinute/appPickup).toString() + 'm', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))
                                            :listData[index]["type"]=='pickup'?
                                                RichText(
                                                    text: TextSpan(
                                                        text: appPickup.toString(),
                                                        style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                                                        children: <TextSpan>[
                                                            TextSpan(
                                                                text: '(times)',
                                                                style: TextStyle(fontSize: 14)
                                                            ),
                                                        ]
                                                    ),
                                                )
                                            :
                                                RichText(
                                                    text: TextSpan(
                                                        text: int.parse(newHour)>0?newHour.toString():'',
                                                        style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                                                        children: <TextSpan>[
                                                            TextSpan(
                                                                text: int.parse(newHour)>0?'h':'',
                                                                style: TextStyle(fontSize: 14)
                                                            ),
                                                            TextSpan(
                                                                text: newMin.toString(),
                                                                style: TextStyle(fontSize: 18,)
                                                            ),
                                                            TextSpan(
                                                                text: 'm',
                                                                style: TextStyle(fontSize: 14)
                                                            ),
                                                        ]
                                                    ),
                                                ),
                                            Padding(
                                                padding: EdgeInsets.only(bottom: 10),
                                                child: Image.network(listData[index]["img"], width: 45, fit: BoxFit.contain)
                                            )
                                        ],
                                    )
                                ]
                            ),
                        ),
                    );
                }
            ),
        );
    }
}