import 'package:flutter/material.dart';
import 'package:tktk2/config/Screen/provider/visor_proveedor.dart';
import 'package:tktk2/config/Screen/shared/video_scroll_ver.dart';
import 'package:provider/provider.dart';

class VisorPantalla extends StatelessWidget {
  const VisorPantalla({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final visorProveedor = context.watch<VisorProveedor>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors.primary,
          title: Center(
            child: Text(
              'PANTALLA VISOR Luis Salas',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ),
        body: visorProveedor.iniciarvideo
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : VideoScrollVer(videoS: visorProveedor.videoos));
  }
}
