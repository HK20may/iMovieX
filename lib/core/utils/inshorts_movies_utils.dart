import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

class InshortsMoviesUtils {
  String formatTodayDate(DateTime today) {
    String formattedDay = DateFormat('d').format(today);
    String formattedMonth = DateFormat('MMM').format(today).toUpperCase();
    String formattedYear = DateFormat('yyyy').format(today);

    String suffix =
        formattedDay.endsWith('1')
            ? 'st'
            : formattedDay.endsWith('2')
            ? 'nd'
            : formattedDay.endsWith('3')
            ? 'rd'
            : 'th';

    return '$formattedDay$suffix $formattedMonth $formattedYear';
  }

  String formatNumber(int number) {
    if (number >= 1000000) {
      double result = number / 1000000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}M';
    } else if (number >= 1000) {
      double result = number / 1000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}K';
    } else {
      return number.toString();
    }
  }

  Future<bool> isInternetConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult[0] == ConnectivityResult.mobile ||
        connectivityResult[0] == (ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}
