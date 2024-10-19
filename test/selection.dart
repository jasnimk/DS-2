void main() {
  List l1 = [9, 3, 1, 89, 12, 67];
  print('List: $l1');
  int n = l1.length;
  for (int i = 0; i < n; i++) {
    int min = i;
    for (int j = i + 1; j < n; j++) {
      if (l1[j] < l1[min]) {
        min = j;
      }
    }
    if (min != i) {
      int temp = l1[min];
      l1[min] = l1[i];
      l1[i] = temp;
    }
  }
  print('sorted list:$l1');
}
