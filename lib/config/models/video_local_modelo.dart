import 'package:tktk2/config/data/videos.dart';

class VideoLocalModelo {
  final String name;
  final String videoURL;
  final int likes;
  final int views;
  final int share;

  VideoLocalModelo({
    required this.name,
    required this.videoURL,
    this.likes = 0,
    this.views = 0,
    this.share = 0,
  });

  factory VideoLocalModelo.fromJson(Map<String, dynamic> json) =>
      VideoLocalModelo(
          name: json["name"] ?? "Sin Nombre de video",
          videoURL: json["videoURL"],
          likes: json["likes"] ?? 0,
          views: json["views"] ?? 0,
          share: json["enviar"] ?? 0);

  Videos EntidadVideos() => Videos(
      nombre: name,
      videoURL: videoURL,
      probar: likes,
      vistas: views,
      enviar: share);
}
