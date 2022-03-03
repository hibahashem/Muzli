
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/songController.dart';

void main() {
  runApp( songPlayer());
}
class songPlayer extends StatelessWidget{
  late MediaQueryData queryData;
  var controller=Get.put(songController());

  @override
  Widget build(BuildContext context) {

    queryData=MediaQuery.of(context);
    var screenWidth = queryData.size.width;
    var screenHeight = queryData.size.height;



return Scaffold(
  body:   Container(
  
    color: Color(0xff0f102e),

    child:   Column(



      children: [

        Padding(

          padding:  EdgeInsets.only(top:screenHeight*0.02),

          child: Row(children: [



              IconButton(icon: const Icon(Icons.arrow_back_ios),color: Colors.white,onPressed: () {Get.back();},padding: EdgeInsets.only(left: 0.02*screenWidth),),

               Expanded(child: Text("Player",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15),))

            ]),

        ),

           Container(child:

           Padding(

             padding:  EdgeInsets.only(top: 0.04*screenHeight),

             child: Column(

                 children:
                 [
                 Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                   BoxShadow(
                   color: Colors.white60.withOpacity(0.2),
                   spreadRadius: screenWidth*0.04,
                   blurRadius: screenWidth*0.1,
                   offset: Offset(5, 5),
                     // changes position of shadow
                 ),
                 ],
                   ),
                   child: CircleAvatar(
                     backgroundImage: NetworkImage(
                       "https://i.pinimg.com/originals/e1/48/9a/e1489a8f208318ef89f32cd0ffb4c1fe.png"
                     ),
                     radius: screenWidth*0.28,
                   ),
                 ),

                   Padding(
                     padding:  EdgeInsets.all(screenHeight*0.05),
                     child: Obx(()=>Text(controller.allSongs[int.parse(controller.Songindex.toString())].title,style: const TextStyle(color: Colors.white,fontSize: 18),)),
                   ),

                   Obx(()=>Text(controller.allSongs[int.parse(controller.Songindex.toString())].artist,style: TextStyle(color: Colors.white,fontSize: 10),)),
                 SliderTheme(
                       data:SliderThemeData(
                         trackHeight: 1,

                           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8)
                       ) ,
                       child:Padding(
                         padding: EdgeInsets.all(screenWidth*0.03),
                         child: Obx(()=>Slider.adaptive(
                           activeColor: Color(0xff8de1f5),
                             thumbColor: Color(0xff8de1f5),
                             inactiveColor: Colors.white60,
                             value: double.parse(controller.position.toString()),
                             max:double.parse(controller.duration.toString()),
                             onChanged: (value) {
                               int seekval = value.round() ;
                               controller.seek(seekval);
                             },

                         )),
                       )
                   ),
                   Obx(()=>Container(
                     margin:EdgeInsets.all(screenWidth*0.05) ,


                     child: Row(children: [

                       Expanded(child: IconButton(onPressed:(){
                         var path=controller.allSongs[int.parse(controller.Songindex.toString())-1].filePath;
                         controller.play(path,int.parse(controller.Songindex.toString())-1);

                       }, icon: Icon(Icons.skip_previous,color: Colors.white,size:screenWidth*0.08))),

                       controller.isplay==false? Expanded(child: IconButton(onPressed:(){controller.play(controller.filepath.toString(),int.parse(controller.Songindex.toString()));}, icon: Icon(Icons.play_circle_filled_sharp,color:  Color(0xff8de1f5),size:screenWidth*0.15))):
                       Expanded(child: IconButton(onPressed:(){controller.stop();}, icon: Icon(Icons.stop_circle,color: Color(0xff8de1f5),size:screenWidth*0.15)))
                       ,
                       Expanded(child: IconButton(onPressed: (){
                         var path=controller.allSongs[int.parse(controller.Songindex.toString())+1].filePath;
                         controller.play(path,int.parse(controller.Songindex.toString())+1);
                       }, icon:Icon(Icons.skip_next,color: Colors.white,size:screenWidth*0.08,) )),
                     ]

                     ),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white60.withOpacity(0.1),
                           spreadRadius: screenWidth*0.02,
                           blurRadius: screenWidth*0.03,
                           offset: Offset(1,1),
                           // changes position of shadow
                         ),
                       ],
                     ),
                   ))


                 ]),

           ),

               decoration: BoxDecoration(
                 boxShadow: [
                   BoxShadow(
                     color: Colors.white60.withOpacity(0.1),
                     spreadRadius: screenWidth*0.02,
                     blurRadius: screenWidth*0.03,
                     // changes position of shadow
                   ),
                 ],
                borderRadius: BorderRadius.all(Radius.circular(30)),

               color: Color(0xff1c1b47),


      ),


             height: 0.85*screenHeight,

             width: 0.9*screenWidth,



           ),
      ],



    ),
  
  ),

);
  }

}