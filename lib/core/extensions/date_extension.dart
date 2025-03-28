import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toPrimaryFormat() => DateFormat('MM/dd/yyyy').format(this);
  String toSecondaryFormat() => DateFormat('MM.dd.yyyy').format(this);
}
