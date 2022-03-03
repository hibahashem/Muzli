
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:update/Controller/homeController.dart';
import 'package:update/View/songslist.dart';

void main() {
  runApp( Home());
}

class Home extends StatelessWidget {
  var controller2=Get.put(homeController());

  static  List<Widget> _pages = <Widget>[
    Songslist(),
    Icon(
      Icons.favorite,
      size: 150,
    ),

  ];

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        body:  Center(
          child: _pages.elementAt(int.parse(controller2.currentIndex.toString())), //New
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: int.parse(controller2.currentIndex.toString()),
          onTap:controller2.ontap ,
          unselectedItemColor: Colors.white,
          selectedItemColor:Color(0xff8de1f5),
          showUnselectedLabels: true,
          backgroundColor: Color(0xff0f102e),

          items: [
            BottomNavigationBarItem(

              icon: Icon(Icons.playlist_play),
              label: 'List',
            ),
            BottomNavigationBarItem(

              icon: Icon(Icons.favorite),
              label: 'favorite',
            ),

          ],
        )
    ));


  }
}


