import 'package:flutter/material.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';

class ItemParticipate extends StatelessWidget {
const ItemParticipate({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: mainPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                  color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(1, 1)
                      ),
                    ],
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          mainTextColor.withOpacity(0.3),
                          BlendMode.darken
                      ),
                      image: NetworkImage('https://cdna.artstation.com/p/assets/images/images/048/483/394/large/siraj-ahmed-new-ape-05.jpg?1650162963'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: mainPadding),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lukaku', style: TextStyle(fontSize: normalTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                    Text('15 minutes ago', style: TextStyle(fontSize: smallTitle, color: normalTextColor, fontFamily: 'RobotoRegular', height: 1.5))
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: mainPadding+5, vertical: mainPadding/2),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: primaryColor,
                        blurRadius: 5,
                        offset: const Offset(1, 1)
                    ),
                  ],
                ),
                child: Text('Follow', textAlign: TextAlign.center, style: TextStyle(fontSize: smallTitle, color: whiteColor, fontFamily: 'RobotoBold')),
              )
            )
          ],
        ),
      ),
    );
  }
}