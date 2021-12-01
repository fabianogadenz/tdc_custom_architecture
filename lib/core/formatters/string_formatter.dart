class StringFormatter {
  static String changeWordCase(String str) {
    String withAccents =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    String withoutAccents =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withAccents.length; i++) {
      str = str.replaceAll(withAccents[i], withoutAccents[i]);
    }
    return str;
  }
}
