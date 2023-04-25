class UtilsService {
  static String formatToMMSS(int milliseconds) {
    // int _seconds = milliseconds % 60, _mins = milliseconds ~/ 60;
    String _seconds = (milliseconds % 60).toString().padLeft(2, '0');
    String _mins = (milliseconds ~/ 60).toString().padLeft(2, '0');
    return "$_mins:$_seconds";
  }
}
