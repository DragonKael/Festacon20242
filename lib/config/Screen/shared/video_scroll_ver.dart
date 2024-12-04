// import 'package:flutter/material.dart';
// import 'package:tktk2/config/Screen/shared/video_botones.dart';
// import 'package:tktk2/config/Screen/shared/videofull_play.dart';
// import 'package:tktk2/config/data/videos.dart';

// class VideoScrollVer extends StatelessWidget {
//   final List<Videos> videoS;
//   const VideoScrollVer({super.key, required this.videoS});

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//     scrollDirection: Axis.vertical,
//     physics: const BouncingScrollPhysics(),
//     itemCount: videoS.length,
//     itemBuilder: (context,index){
//       final Videos videos=videoS[index];
//       return Stack(
//         children: [
//           // videos+gradiente
//           SizedBox.expand(
//             // child:Container(color: Colors.red),
//             child: VideoFullPlayer(
//               nombre: videos.nombre,
//               videoURL: videos.videoURL),
//           ),
//           // iconos o botones
//           Positioned(bottom: 40,
//           right: 20,
//           child: VideoBotones(videos: videos),
//           )
//         ],
//       );
//     },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tktk2/config/Screen/shared/video_botones.dart';
import 'package:tktk2/config/Screen/shared/videofull_play.dart';
import 'package:tktk2/config/data/videos.dart';

class VideoScrollVer extends StatelessWidget {
  final List<Videos> videoS;

  VideoScrollVer({super.key, required this.videoS});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videoS.length,
      itemBuilder: (context, index) {
        final Videos videos = videoS[index];
        // Crear un nuevo ValueNotifier para cada video
        final ValueNotifier<double> opacityNotifier = ValueNotifier(1.0);

        return Stack(
          children: [
            SizedBox.expand(
              child: VideoFullPlayer(
                nombre: videos.nombre,
                videoURL: videos.videoURL,
                opacityNotifier: opacityNotifier, // Pasar el notifier aquí
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoBotones(videos: videos),
            ),
          ],
        );
      },
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return PageView.builder(
//     scrollDirection: Axis.vertical,
//     physics: const BouncingScrollPhysics(),
//     itemCount: videoS.length,
//     itemBuilder: (context, index) {
//       final Videos videos = videoS[index];
//       return Stack(
//         children: [
//           SizedBox.expand(
//             child: VideoFullPlayer(
//               nombre: videos.nombre,
//               videoURL: videos.videoURL,
//               opacityNotifier: opacityNotifier, // Pasar el notifier aquí
//             ),
//           ),
//           Positioned(
//             bottom: 40,
//             right: 20,
//             child: VideoBotones(
//               videos: videos,
//               opacityNotifier: opacityNotifier, // Pasar el opacityNotifier
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
