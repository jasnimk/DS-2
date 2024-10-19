void main() {
  String s = 'hello';
  print(s);
  List s1 = s.split('');
  for (int i = 0; i < s.length; i++) {
    for (int j = 0; j < s.length - i - 1; j++) {
      if (s1[j].compareTo(s1[j + 1]) > 0) {
        String temp = s1[j];
        s1[j] = s1[j + 1];
        s1[j + 1] = temp;
      }
    }
  }
  print(s1.join());
}
