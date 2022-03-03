import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:update/View/songPlayer.dart';

import '../Controller/songController.dart';
class Songslist extends StatelessWidget{

var controller=Get.put(songController());
late MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData=MediaQuery.of(context);
    var screenWidth = queryData.size.width;
    var screenHeight = queryData.size.height;
return Scaffold(
  body:
  Stack(
    children: [Container(color: Color(0xff0f102e)),
      Image.network("https://thumbs.dreamstime.com/b/retro-landscape-blue-background-d-vector-futuristic-technology-mountain-digital-city-neon-s-music-216788169.jpg",height: screenHeight*0.3,width: screenWidth,)
    ,
    Center(
      child: Container(
        margin: EdgeInsets.only(top:screenHeight*0.3),
        width: screenWidth*0.9,
        height: screenHeight*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),

          color: Color(0xff1c1b47),


        ),
          child: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Obx(()=>ListView.builder(
                itemCount: controller.allSongs.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(

                      trailing:
                      IconButton(icon:Icon(Icons.play_arrow,color: Color(0xff8de1f5),),
                         onPressed:(){
                        controller.resetposition();
                        Get.to(songPlayer());
                        controller.play(controller.allSongs[index].filePath,index);
                        } ,
                      ),

                      leading:Icon(Icons.album,color: Colors.white,),

                      title:Text(controller.allSongs[index].title,  style: TextStyle(
                          color: Colors.white,fontSize: 20),),

                  );
                }
            ),),
          ),
        ),
    )
      ],

  )
);
  }

}