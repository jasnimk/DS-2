void main() {
  List l1 = [9, 3, 1, 89, 12, 67];
  print('List: $l1');
  int n = l1.length;
  for (int i = 0; i < n; i++) {
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
