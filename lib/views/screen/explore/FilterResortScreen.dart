// ignore_for_file: prefer_const_constructors

import 'package:community_material_icon/community_material_icon.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/utils/constant.dart';
import 'package:tripzone/utils/data.dart';
import 'package:tripzone/views/screen/explore/ExploreScreen.dart';
import 'package:tripzone/views/widgets/tags.dart';
import 'package:tripzone/views/widgets/tween_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterResortScreen extends StatelessWidget {
    const FilterResortScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                body: const MyStatefulWidget(),
            ),
        );
    }
}

class MyStatefulWidget extends StatefulWidget {
    const MyStatefulWidget({Key? key}) : super(key: key);

    @override
    State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    int displayTags = 6;
    double minDistance = 10;
    double maxDistance = 1000;
    int provinceSelected = 0;
    double _currentSliderValue = 10;

    @override
    void initState() { 
        listProvinces[0]['status'] = 'active';
        listCategories[0]['status'] = 'active';
        super.initState();
    }

    // Action Function For Select Multiple Provinces
    handleSelectProvince(int index) {
        setState(() {
            if(listProvinces[0]['status'] == 'disactive' && index==0){
                for (var item in listProvinces) {
                    listProvinces[0]['status'] = 'active';
                    listProvinces[listProvinces.indexOf(item)]['status'] = 'disactive';
                }
            }else if(listProvinces[0]['status'] == 'active' && index==0){
                print('This button cannot select because it\'s must be in active.');
            }else{
                if(listProvinces[index]['status'] == 'active'){
                    listProvinces[index]['status'] = 'disactive';
                }else{
                    listProvinces[index]['status'] = 'active';
                    listProvinces[0]['status'] = 'disactive';
                }
            }
        });
    }

    // Action Function For Select Multiple Categories
    handleSelectCategory(int index) {
        setState(() {
            if(listCategories[0]['status'] == 'disactive' && index==0){
                for (var item in listCategories) {
                    listCategories[0]['status'] = 'active';
                    listCategories[listCategories.indexOf(item)]['status'] = 'disactive';
                }
            }else if(listCategories[0]['status'] == 'active' && index==0){
                print('This button cannot select because it\'s must be in active.');
            }else{
                if(listCategories[index]['status'] == 'active'){
                    listCategories[index]['status'] = 'disactive';
                }else{
                    listCategories[index]['status'] = 'active';
                    listCategories[0]['status'] = 'disactive';
                }
            }
        });
    }

    // Action Function For Select Single Star Rating
    handleSelectStarRating(int index) {
        setState(() {
            for (var item in listStar) {
                if(listStar.indexOf(item) == index){
                    listStar[index]['status'] = 'active';
                }else{
                    listStar[listStar.indexOf(item)]['status'] = 'disactive';
                }
            }
        });
    }
    
    // Action Function For Select Single Sort By
    handleSelectSortBy(int index) {
        setState(() {
            for (var item in listSortBy) {
                if(listSortBy.indexOf(item) == index){
                    listSortBy[index]['status'] = 'active';
                }else{
                    listSortBy[listSortBy.indexOf(item)]['status'] = 'disactive';
                }
            }
        });
    }

    Widget _listProvince({required List listData}) {
        return(
            Wrap(
                spacing: mainPadding, // gap between adjacent chips
                runSpacing: mainPadding,
                children: listData.map((element) {
                    int lengthData = listData.length;
                    var index = listData.indexOf(element);
                    return Tags(index, displayTags, element, onTap: () {handleSelectProvince(index);});
                }).toList(),
            )
        );
    }
    Widget _listCategory({required List listData}) {
        return(
            Wrap(
                spacing: mainPadding, // gap between adjacent chips
                runSpacing: mainPadding,
                children: listData.map((element) {
                    int lengthData = listData.length;
                    var index = listData.indexOf(element);
                    return Tags(index, displayTags, element, onTap2: () {setState(() {
                        displayTags= 100;
                    });}, onTap: () {handleSelectCategory(index);});
                }).toList(),
            )
        );
    }
    Widget _listStarRating({required List listData}) {
        return(
            Wrap(
                spacing: mainPadding, // gap between adjacent chips
                runSpacing: mainPadding,
                children: listData.map((element) {
                    int lengthData = listData.length;
                    var index = listData.indexOf(element);
                    return Tags(index, displayTags, element, onTap: () {handleSelectStarRating(index);});
                }).toList(),
            )
        );
    }
    Widget _listSortBy({required List listData}) {
        return(
            Wrap(
                spacing: mainPadding, // gap between adjacent chips
                runSpacing: mainPadding,
                children: listData.map((element) {
                    int lengthData = listData.length;
                    var index = listData.indexOf(element);
                    return Tags(index, displayTags, element, onTap: () {handleSelectSortBy(index);});
                }).toList(),
            )
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: whiteColor,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
                        color: whiteColor,
                        margin: EdgeInsets.only(bottom: btnHeight+(mainPadding*3)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                ///// Display Block Back To Previous Screen
                                SizedBox(
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
                                            SizedBox(width: mainPadding),
                                            Text('Filter', style: TextStyle(fontSize: bigTitle, color: mainTextColor, fontFamily: 'RobotoBold'))
                                        ],
                                    ),
                                ),
                                SizedBox(height: mainPadding*2),
                                ///// Display Block Distance
                                SizedBox(
                                  child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Container(
                                                padding: EdgeInsets.only(left: mainPadding),
                                                child: RichText(
                                                    text: TextSpan(
                                                        text: 'Distance' + ' ',
                                                        style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold'),
                                                        children: <TextSpan>[
                                                            TextSpan(
                                                                text: _currentSliderValue.toString(),
                                                                style: TextStyle(fontSize: titleResort, color: normalTextColor, fontFamily: 'RobotoMedium')
                                                            ),
                                                            TextSpan(
                                                                text: ' ' + 'km',
                                                                style: TextStyle(fontSize: titleResort, color: normalTextColor, fontFamily: 'RobotoMedium')
                                                            ),
                                                        ]
                                                    ),
                                                ),
                                            ),
                                            SliderTheme(
                                                data: SliderThemeData(
                                                    trackHeight: 5,
                                                ),
                                                child: Slider(
                                                    value: _currentSliderValue,
                                                    min: minDistance,
                                                    max: maxDistance,
                                                    divisions: 99,
                                                    label: _currentSliderValue.toString() + ' km',
                                                    inactiveColor: normalTextColor.withOpacity(0.5),
                                                    activeColor: primaryColor,
                                                    onChanged: (double value) {
                                                        setState(() {
                                                            _currentSliderValue = value;
                                                        });
                                                    },
                                                )
                                            ),
                                        ],
                                    ),
                                ),
                                ///// Display Content Provinces
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                    margin: EdgeInsets.only(top: mainPadding*2),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text('Provinces', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                                            SizedBox(height: mainPadding),
                                            _listProvince(listData: listProvinces)

                                        ],
                                    ),
                                ),
                                ///// Display Block Cateogries
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                    margin: EdgeInsets.only(top: mainPadding*2),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text('Cateogries', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                                            SizedBox(height: mainPadding),
                                            _listCategory(listData: listCategories)
                                        ],
                                    ),
                                ),
                                ///// Display Block Star Rating
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                    margin: EdgeInsets.only(top: mainPadding*2),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text('Star Rating', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                                            SizedBox(height: mainPadding),
                                            _listStarRating(listData: listStar)
                                        ],
                                    ),
                                ),
                                ///// Display Block Sort By
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: mainPadding),
                                    margin: EdgeInsets.only(top: mainPadding*2),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text('Sort Bys', style: TextStyle(fontSize: subTitle, color: mainTextColor, fontFamily: 'RobotoBold')),
                                            SizedBox(height: mainPadding),
                                            _listSortBy(listData: listSortBy)
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
            floatingActionButton: TweenButton(
                firstAction: () {Get.to(ExploreScreen());}
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
    }
}
