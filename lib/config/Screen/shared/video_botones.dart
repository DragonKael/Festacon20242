import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tktk2/config/data/videos.dart';
import 'package:tktk2/config/formats/formato_visibles.dart';

class VideoBotones extends StatelessWidget {
  final Videos videos;
  const VideoBotones({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BotonPersonalizado(
            valor: videos.probar,
            icono: Icons.favorite,
            colorIcono: Colors.red),
        const SizedBox(
          height: 20,
        ),
        _BotonPersonalizado(
            valor: videos.vistas, icono: Icons.remove_red_eye_outlined),
        const SizedBox(
          height: 20,
        ),
        _BotonPersonalizado(valor: videos.enviar, icono: Icons.send),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 5),
            child: const _BotonPersonalizado(
                valor: 0, icono: Icons.play_circle_outline))
      ],
    );
  }
}

class _BotonPersonalizado extends StatelessWidget {
  final int valor;
  final IconData icono;
  final Color? color;
  const _BotonPersonalizado(
      {super.key, required this.valor, required this.icono, colorIcono})
      : color = colorIcono ?? Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icono,
              color: color,
            )),
        if (valor > 0)
          Text(FormatosVisibles.formatoVisibleNumeros(valor.toDouble()))
      ],
    );
  }
}

// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:tktk2/config/data/videos.dart';
// import 'package:tktk2/config/formats/formato_visibles.dart';

// class VideoBotones extends StatelessWidget {
//   final Videos videos;
//   final ValueNotifier<double> opacityNotifier; // Añadir el ValueNotifier

//   const VideoBotones({
//     super.key,
//     required this.videos,
//     required this.opacityNotifier, // Recibir el notifier
//   });

//   Color _getButtonTextColor(double opacity) {
//     // Definir un umbral de luminosidad para decidir el color del texto
//     const double threshold = 0.5;

//     // El color del texto del botón cambia dependiendo de la opacidad
//     if (opacity < threshold) {
//       // Si la opacidad es baja, usar texto oscuro
//       return Colors.black.withOpacity(1 - opacity); // Texto negro
//     } else {
//       // Si la opacidad es alta, usar texto claro
//       return Colors.white.withOpacity(opacity); // Texto blanco
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<double>(
//       valueListenable: opacityNotifier,
//       builder: (context, opacity, child) {
//         Color buttonTextColor = _getButtonTextColor(opacity); // Obtener el color del texto del botón

//         return Column(
//           children: [
//             _BotonPersonalizado(
//               valor: videos.probar,
//               icono: Icons.favorite,
//               colorIcono: Colors.red,
//               textoColor: buttonTextColor, // Pasar el color calculado
//             ),
//             const SizedBox(height: 20),
//             _BotonPersonalizado(
//               valor: videos.vistas,
//               icono: Icons.remove_red_eye_outlined,
//               textoColor: buttonTextColor, // Pasar el color calculado
//             ),
//             const SizedBox(height: 20),
//             _BotonPersonalizado(
//               valor: videos.enviar,
//               icono: Icons.send,
//               textoColor: buttonTextColor, // Pasar el color calculado
//             ),
//             const SizedBox(height: 20),
//             SpinPerfect(
//               infinite: true,
//               duration: const Duration(seconds: 5),
//               child: const _BotonPersonalizado(
//                 valor: 0,
//                 icono: Icons.play_circle_outline,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _BotonPersonalizado extends StatelessWidget {
//   final int valor;
//   final IconData icono;
//   final Color? colorIcono;
//   final Color? textoColor; // Añadir el color del texto
//   const _BotonPersonalizado({
//     super.key,
//     required this.valor,
//     required this.icono,
//     this.colorIcono,
//     this.textoColor = Colors.black, // Valor por defecto
//   }) : colorIcono = colorIcono ?? Colors.blueAccent;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         IconButton(
//           onPressed: () {},
//           icon: Icon(icono, color: colorIcono),
//         ),
//         if (valor > 0)
//           Text(
//             FormatosVisibles.formatoVisibleNumeros(valor.toDouble()),
//             style: TextStyle(color: textoColor), // Aplicar el color del texto
//           ),
//       ],
//     );
//   }
// }
