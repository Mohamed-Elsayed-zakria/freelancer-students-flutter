import 'package:intl/intl.dart';

class MyDateUtil {
  static String convertDateTime({required String historyAsText}) {
    final DateTime dateTime = DateTime.parse(historyAsText);
    final DateTime now = currentDateTimeFromDevice();
    final Duration difference = now.difference(dateTime);
    if (difference.inSeconds < 3) {
      return 'now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} second ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour ago';
    } else if (difference.inHours < 48) {
      return 'yesterday';
    } else {
      return DateFormat('MMMM d, ' 'y').format(dateTime);
    }
  }

  static DateTime currentDateTimeFromDevice() {
    return DateTime.now();
  }
}
