import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toPrimaryFormat() => DateFormat('MM/dd/yyyy').format(this);
}
