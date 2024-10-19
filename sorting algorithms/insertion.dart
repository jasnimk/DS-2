void main() {
  List l1 = [4, 5, 1, 2, 9, 3, 1, 0];
  print('original list:$l1');
  for (int i = 0; i < l1.length; i++) {
    int key = l1[i];
    int j = i - 1;
    while (j >= 0 && l1[j] > key) {
      l1[j + 1] = l1[j];
      j--;
    }
    l1[j + 1] = key;
  }
  print('sorted list:$l1');
}
