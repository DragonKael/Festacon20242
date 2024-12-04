import 'package:intl/intl.dart';

class FormatosVisibles {
  static String formatoVisibleNumeros(double numero){
    final formatearNumero=NumberFormat.compactCurrency(
      decimalDigits:0,
      symbol: '').format(numero);
      return formatearNumero;
  }
}