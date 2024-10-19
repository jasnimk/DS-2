void main() {
  List l1 = [2, 1, 4, 3, 39, 4, 7];
  print('original list:$l1');
  for (int i = 0; i < l1.length; i++) {
    int min = i;
    for (int j = i + 1; j < l1.length; j++) {
      if (l1[j] < l1[min]) {
        min = j;
      }
    }
    if (i != min) {
      int temp = l1[i];
      l1[i] = l1[min];
      l1[min] = temp;
    }
  }
  print('sorted list:$l1');
}
