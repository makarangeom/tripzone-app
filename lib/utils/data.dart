import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tripzone/themes/colors.dart';

final List<dynamic> listResorts = [
    {
        "name": "Tek Thlak TahTai",
        "img": "assets/images/koh_sdach01.jpg"
    },{
        "name": "Tek Thlak TahTai",
        "img": "assets/images/koh_sdach02.jpg"
    },{
        "name": "Tek Thlak TahTai",
        "img": "assets/images/koh_sdach03.jpg"
    },{
        "name": "Tek Thlak TahTai",
        "img": "assets/images/koh_sdach04.jpg"
    },{
        "name": "Tek Thlak TahTai",
        "img": "assets/images/koh_sdach05.jpg"
    }
];

final List<String> imgList = [
    'assets/images/koh_sdach01.jpg',
    'assets/images/koh_sdach02.jpg',
    'assets/images/koh_sdach03.jpg',
    'assets/images/koh_sdach04.jpg',
    'assets/images/koh_sdach05.jpg',
];

final List listCategories = [
    {
        "name": "All",
        "img": "assets/images/categories/all.png",
    },{
        "name": "Beach",
        "img": "assets/images/categories/beach.png",
    },{
        "name": "Camping",
        "img": "assets/images/categories/camping.png",
    },{
        "name": "Mountain",
        "img": "assets/images/categories/mountain.png",
    },{
        "name": "Island",
        "img": "assets/images/categories/island.png",
    },{
        "name": "Temple",
        "img": "assets/images/categories/temple.png",
    },{
        "name": "Museum",
        "img": "assets/images/categories/museum.png",
    },{
        "name": "Farm",
        "img": "assets/images/categories/farm.png",
    },{
        "name": "Beach",
        "img": "assets/images/categories/mountain.png",
    },{
        "name": "Zoo",
        "img": "assets/images/categories/zoo.png",
    },{
        "name": "Beach",
        "img": "assets/images/categories/mountain.png",
    },{
        "name": "Beach",
        "img": "assets/images/categories/mountain.png",
    },{
        "name": "Beach",
        "img": "assets/images/categories/mountain.png",
    },
];

final List<dynamic> listProvinces = [
    {
        "name": "All",
        "img": "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"
    },{
        "name": "Banteay Meanchey",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Oddar-Meanchey-Province-1024x720.jpg"
    },{
        "name": "Battambang",
        "img": "https://www.cambotours.com/userfiles/thumbs/battambang-city-tour-by-tuk-tuk-full-day.jpg"
    },{
        "name": "Kampong Cham",
        "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPi4KDnj1nkTpAJnDIhaJmVkJr4DbNtUwMM4UzP5VEvek_1H-UtVlucgsRFXoLm0BXYNI&usqp=CAU"
    },{
        "name": "Kampong Chhnang",
        "img": "https://escape-from-city.s3.amazonaws.com/uploads/destination/cover/136/standard_l-kampong-chhnang-profile.jpg"
    },{
        "name": "Kampong Speu",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Kampong-Speu-Province-1024x576.jpg"
    },{
        "name": "Kampong Thom",
        "img": "https://www.khmertimeskh.com/wp-content/uploads/2019/01/3-1-kampong_thom_0.jpg"
    },{
        "name": "Kampot",
        "img": "https://4.bp.blogspot.com/-D2QOpwct0RI/WE_jbNbqL6I/AAAAAAAAAJg/HeXEf1NMv54v9QSEdROOU-_LKRWUlUHmwCLcB/s1600/komtop-province.jpg"
    },{
        "name": "Kandal",
        "img": "https://www.khmertimeskh.com/wp-content/uploads/2021/05/21117.jpg"
    },{
        "name": "Koh Kong",
        "img": "https://cambodiaprivatecarservice.com/uploads/Koh%20Kong.PNG"
    },{
        "name": "Kratié",
        "img": "https://www.mondulkiriproject.org/wp-content/uploads/2019/06/Kratie-dolphin.jpg"
    },{
        "name": "Mondulkiri",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/mondulkiri-province-1024x751.jpg"
    },{
        "name": "Phnom Penh",
        "img": "https://files.intocambodia.org/content/small/adfb128d97ca55fe045fd0dc2af2c285.jpg"
    },{
        "name": "Preah Vihear",
        "img": "https://cambodianess.com/uploads/images/1594111605mqjxo-photo-2020-07-07-15-46-26.jpg"
    },{
        "name": "Prey Veng",
        "img": "https://jotun-professionals-prod.azurewebsites.net/jotunimages.azureedge.net/images/images/pub-camb-neakloeung-01-1350x860_tcm197-116112.jpg"
    },{
        "name": "Pursat",
        "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8wL_ZEkj1ysvhSnUDoDaQeSYhjFQyuml9T3xFkop2ER-CNhwreDoQ3nooB2JAUbBlB44&usqp=CAU"
    },{
        "name": "Ratanakiri",
        "img": "https://www.mondulkiriproject.org/wp-content/uploads/2019/06/Ratanakiri.jpg"
    },{
        "name": "Siem Reap",
        "img": "https://api.time.com/wp-content/uploads/2021/10/worlds-greatest-places-2021-001-Siem-Reap-Cambodia.jpg"
    },{
        "name": "Preah Sihanouk",
        "img": "https://m.justgola.com/media/a/00/03/15574_og_1.jpeg"
    },{
        "name": "Stung Treng",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Oddar-Meanchey-Province-1024x720.jpg"
    },{
        "name": "Svay Rieng",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Oddar-Meanchey-Province-1024x720.jpg"
    },{
        "name": "Takeo",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Oddar-Meanchey-Province-1024x720.jpg"
    },{
        "name": "Oddar Meanchey",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Oddar-Meanchey-Province-1024x720.jpg"
    },{
        "name": "Kep",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Oddar-Meanchey-Province-1024x720.jpg"
    },{
        "name": "Pailin",
        "img": "https://www.gdtp.gov.kh/wp-content/uploads/2021/01/Oddar-Meanchey-Province-1024x720.jpg"
    }
];
final List<dynamic> listStar = [
    {
        "name": "1 stars"
    },{
        "name": "2 stars"
    },{
        "name": "3 stars"
    },{
        "name": "4 stars"
    },{
        "name": "5 stars"
    }
];
final List<dynamic> listSortBy = [
    {
        "name": "Distance"
    },{
        "name": "Popular"
    },{
        "name": "Newest"
    },{
        "name": "Oldest"
    }
];
final List<dynamic> listToDo = [
  {
    "title": "Travel Guide",
    "type": "guide",
    "color": Color(0xFF3C7FFF),
    "icon": CommunityMaterialIcons.walk,
    "size": 38.0
  },{
    "title": "Nearby Hotels",
    "type": "hotel",
    "color": Color(0xFFFFA13A),
    "icon": Icons.hotel,
    "size": 34.0
  },{
    "title": "Nearby Restaurants",
    "type": "restaurant",
    "color": Color(0xFFFF3776),
    "icon": Ionicons.restaurant,
    "size": 31.0
  },{
    "title": "User Reviews",
    "type": "review",
    "color": Color(0xFF4A61FF),
    "icon": CommunityMaterialIcons.message_draw,
    "size": 32.toDouble()
  }
];
