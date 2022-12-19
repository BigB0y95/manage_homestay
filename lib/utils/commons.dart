import 'package:intl/intl.dart';

class Commons {
  static DateTime formatDateTimeZone(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(dateTime);
  }
}
