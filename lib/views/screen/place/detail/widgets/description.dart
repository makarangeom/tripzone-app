import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';

class Description extends StatelessWidget {
Description({ Key? key }) : super(key: key);
  List<int> rangeStar = [1, 2, 3, 4, 5];
  double calStar = 3;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: mainPadding, right: mainPadding, bottom: mainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trip at TaTai Waterfall', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
            SizedBox(height: 5),
            ///// Display review rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: rangeStar.map((element) {
                        int lengthData = rangeStar.length;
                        var index = rangeStar.indexOf(element);
                        return Icon(CommunityMaterialIcons.star, size: 20, color: element<=calStar?btnBgrColor:bgrNormalBtn.withOpacity(.5));
                      }).toList(),
                    ),
                    SizedBox(width: 10),
                    Text('(' + calStar.toString() + ')', style: TextStyle(fontSize: normalTitle, color: mainTextColor, height: 1.5, fontFamily: 'RobotoRegular'))
                  ],
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: mainPadding, vertical: 5),
                    decoration: BoxDecoration(
                      color: btnBgrColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1.5,
                        color: whiteColor
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: mainTextColor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(2, 2)
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text('Rating Now', style: TextStyle(fontSize: normalTitle, color: whiteColor, fontFamily: 'RobotoBold')),
                        SizedBox(width: mainPadding/2),
                        Icon(Ionicons.arrow_forward_circle_outline, size: 20, color: whiteColor)
                      ],
                    )
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            ///// Display total views and time of uploaded
            Row(
              children: [
                Row(
                  children: [
                    Icon(Ionicons.eye, size: 16),
                    SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                        text: '120',
                        style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular'),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ' + 'views',
                            style: TextStyle(color: normalTextColor)
                          ),
                        ]
                      ),
                    )
                  ],
                ),
                SizedBox(width: mainPadding*2),
                Row(
                  children: [
                    Icon(CommunityMaterialIcons.clock, size: 15),
                    SizedBox(width: 3),
                    RichText(
                      text: TextSpan(
                        text: '15',
                        style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular'),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ' + 'minutes ago',
                            style: TextStyle(color: normalTextColor)
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            ///// Display distant and location
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin, size: 18),
                    SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                        text: '11,702',
                        style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular'),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ' + 'km away',
                            style: TextStyle(color: normalTextColor)
                          ),
                        ]
                      ),
                    )
                  ],
                ),
                SizedBox(width: mainPadding*2),
                Row(
                  children: [
                    Icon(Icons.directions, size: 16),
                    SizedBox(width: 3),
                    Text('Koh Kong, Cambodia', style: TextStyle(fontSize: normalTitle, color: mainTextColor, height: 1.5, fontFamily: 'RobotoRegular'))
                  ],
                ),
              ],
            ),
            SizedBox(height: mainPadding*2),
            ///// Display description
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit id commodo, pharetra adipiscing felis amet tempus. Adipiscing eget cursus sed porttitor ut tellus pellentesque sed mauris. In vitae lectus augue amet vitae, sit. Urna, amet dolor est elementum suspendisse nibh eget. Amet amet, semper malesuada sit ante pharetra. Laoreet orci eu elementum et lorem facilisis non. Nibh pellentesque feugiat mi magna tristique pellentesque. Tristique id dictum sodales est, felis, sed. Et, dui dignissim cursus dignissim sed odio. Diam ut ultricies fames phasellus quisque nisi, donec. Consectetur pretium quis eu, vitae, at rhoncus, blandit porta.', 
              style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoRegular')
            ),
          ],
        ),
    );
  }
}