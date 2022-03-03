import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';


class songController extends GetxController {
  var allSongs = <SongInfo>[].obs;
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  var isempty=false.obs;
  var isloading=false.obs;
  var iserror=false.obs;
  var isplay=false.obs;
 var  position=0.obs;
  var  duration=0.obs;
  var Songindex=0.obs;
  var filepath=''.obs;
  AudioPlayer audioPlayer=new AudioPlayer();


  @override
  void onInit() {
    getJokes();

    super.onInit();


  }



 Future getJokes() async {

    try {
      isloading(true);
      List<SongInfo> songs = await audioQuery.getSongs();
      if(songs!=null) {
        allSongs.value = songs;

      }
      else{
        isempty(true);
      }


    }catch(e) {
      iserror(true);

    }finally {
      isloading(false);

    }
  }
   play(String singpath ,int index)
  async{


    audioPlayer.play(singpath,isLocal: true);
    isplay(true);
    Songindex(index);
    duration(int.parse(allSongs[index].duration));
     filepath(singpath);
    audioPlayer.onAudioPositionChanged.listen((Duration  p) {
      position(p.inMilliseconds);
    });

        }
   seek(int seekvalue)
   async {
     int result = await audioPlayer.seek(Duration(milliseconds: seekvalue));
     if(result == 1){ //seek successful


       position(seekvalue);
       print(position);



     }else{
       print("Seek unsuccessful.");
     }
   }

   resetposition()
   {
     position(0);
   }
   stop()
   {
     audioPlayer.stop();
     isplay(false);
   }
}