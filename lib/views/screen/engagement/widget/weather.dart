import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
    const Weather({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context){
        double screenWidth = MediaQuery.of(context).size.width;
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 0)
                    ),
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/cloud.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), 
                        BlendMode.dstATop
                    ),
                ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/8047/8047218.png'), fit: BoxFit.contain, height: 60),
                            SizedBox(width: 10),
                            RichText(
                                text: TextSpan(
                                    text: '28',
                                    style: TextStyle(fontSize: 38, color: Colors.white, fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                        TextSpan(
                                            text: '°C',
                                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)
                                        ),
                                    ]
                                ),
                            ),
                        ],
                    ),
                    Container(
                        height: 32,
                        width: 1,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Icon(Icons.location_on_sharp, size: 20, color: Colors.white),
                                    SizedBox(width: 5),
                                    Container(
                                      width: screenWidth/3,
                                      child: Container(
                                        child: Text('Khan Chamkar Mon', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                        softWrap: true,
                                        maxLines: 3,
                                        ),
                                      ),
                                    )
                                ],
                            ),
                            SizedBox(height: 5),
                            Text('Cloudy, ' + '29' + '~' + '25' + '°C', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500)),
                        ],
                    )
                ],
            ),
        );
    }
}