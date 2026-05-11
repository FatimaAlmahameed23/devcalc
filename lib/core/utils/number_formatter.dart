import 'package:intl/intl.dart';

String formatNumber(double num){
  final formatter = NumberFormat('#,##0.######');
  return formatter.format(num);
}


