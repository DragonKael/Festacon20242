import 'package:flutter/material.dart';
import 'package:tktk2/config/data/videos.dart';
import 'package:tktk2/config/models/video_local_modelo.dart';
import 'package:tktk2/config/shared/video_local.dart';

class VisorProveedor extends ChangeNotifier {
  bool iniciarvideo = true;
  List<Videos> videoos = [];
  Future<void> llamarVideo() async {
    //espera del video
    await Future.delayed(const Duration(seconds: 2));
    //convertimo a json a nuestro tipo de dato video
    final List<Videos> nuevosVideos = videoLocal
        .map((videos) => VideoLocalModelo.fromJson(videos).EntidadVideos())
        .toList();
    videoos.addAll(nuevosVideos);
    iniciarvideo = false;
    notifyListeners();
  }
}
