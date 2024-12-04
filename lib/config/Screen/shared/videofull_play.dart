import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoFullPlayer extends StatefulWidget {
  final String nombre;
  final String videoURL;
  final ValueNotifier<double> opacityNotifier; // Recibir opacityNotifier

  const VideoFullPlayer({
    super.key,
    required this.nombre,
    required this.videoURL,
    required this.opacityNotifier, // Recibir el opacityNotifier
  });

  @override
  State<VideoFullPlayer> createState() => _VideoFullPlayerState();
}

class _VideoFullPlayerState extends State<VideoFullPlayer> {
  late VideoPlayerController _controladorVideo;

  @override
  void initState() {
    super.initState();
    _controladorVideo = VideoPlayerController.asset(widget.videoURL)
      ..setVolume(10)
      ..setLooping(true)
      ..play();

    // Aquí puedes ajustar la opacidad dependiendo de la duración del video o la posición
    // Usaremos un Timer para simular un cambio de opacidad por simplicidad
    _controladorVideo.addListener(() {
      final duration = _controladorVideo.value.position.inSeconds;
      final maxDuration = _controladorVideo.value.duration.inSeconds;

      // Cambia la opacidad basada en la posición del video
      if (maxDuration > 0) {
        final opacity = (1.0 - (duration / maxDuration)).clamp(0.0, 1.0);
        widget.opacityNotifier.value = opacity; // Actualizar el ValueNotifier
      }
    });
  }

  @override
  void dispose() {
    _controladorVideo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controladorVideo.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }
        return AspectRatio(
          aspectRatio: _controladorVideo.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(_controladorVideo),
              // Capa con gradiente
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5), // Gradiente oscuro
                        Colors.transparent, // Gradiente claro
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 30,
                child: _NombreVideo(
                  descripcion: widget.nombre,
                  opacityNotifier:
                      widget.opacityNotifier, // Pasar el opacityNotifier
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NombreVideo extends StatelessWidget {
  final String descripcion;
  final ValueNotifier<double> opacityNotifier;

  const _NombreVideo({
    super.key,
    required this.descripcion,
    required this.opacityNotifier,
  });

  // Color _getTextColor(double opacity) {
  //   const double threshold = 0.3; // Ajustar umbral según se necesite

  //   if (opacity < threshold) {
  //     return Colors.white.withOpacity(1 - opacity);
  //   } else {
  //     return Colors.black.withOpacity(opacity);
  //   }
  // }

  Color _getTextColor(double opacity) {
    // Definir un umbral de luminosidad para decidir el color del texto
    const double threshold = 0.5;

    // El color del texto cambia dependiendo de la opacidad
    if (opacity < threshold) {
      // Si la opacidad es baja, usar texto oscuro
      return Colors.black.withOpacity(1 - opacity); // Texto negro
    } else {
      // Si la opacidad es alta, usar texto claro
      return Colors.white.withOpacity(opacity); // Texto blanco
    }
  }

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size;
    final estiloTitulo = Theme.of(context).textTheme.titleLarge;

    return ValueListenableBuilder<double>(
      valueListenable: opacityNotifier,
      builder: (context, opacity, child) {
        Color textColor = _getTextColor(opacity);
        print('Opacity: $opacity'); // Debugging
        print('Text color: $textColor'); // Debugging

        return Container(
          // color: Colors.grey.withOpacity(0.3), // Solo para pruebas visuales
          width: ancho.width * 0.6,
          child: Text(
            descripcion,
            maxLines: 2,
            style: estiloTitulo?.copyWith(
              color: textColor,
            ),
          ),
        );
      },
    );
  }
}
