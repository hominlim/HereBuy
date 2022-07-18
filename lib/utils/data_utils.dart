import 'package:intl/intl.dart';

class DataUtils {
  static final oCcy = new NumberFormat("#,###", "en_CAD");
  static String calcStringToCAD(String priceString) {
    if (priceString == "Free" || priceString == "무료나눔") return priceString;
    return "${oCcy.format(int.parse(priceString))} CAD";
  }
}
