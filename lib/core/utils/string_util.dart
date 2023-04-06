class StringUtil {
  static String capitalizeFirstLetter(String word) {
    if (word.isEmpty) return word;
    return word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
  }
}