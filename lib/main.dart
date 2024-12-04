import 'package:tktk2/config/Screen/provider/visor_proveedor.dart';
import 'package:tktk2/config/themes/app_tema.dart';
import 'package:flutter/material.dart';
import 'package:tktk2/config/Screen/visor_pantalla.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // lazy: false
          create: (_) => VisorProveedor()..llamarVideo(),
        )
      ],
      // providers: [ChangeNotifierProvider(create: (_)=>ChatProveedor(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material lucho App',
        theme: AppTema(selectorColor: 4).tema(),
        home: const VisorPantalla(),
        // home: const ChatPatalla(),
      ),
    );
  }
}
// flutter pub upgrade
// flutter pub add provider
// fluter pud add dio