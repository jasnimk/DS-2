void main() {
  List l1 = [9, 3, 1, 89, 12, 67];
  print('List: $l1');
  int n = l1.length;
  bool swap = false;
  for (int i = 0; i < n; i++) {
    swap = false;
    for (int j = 0; j < n - i - 1; j++) {
      if (l1[j] > l1[j + 1]) {
        int temp = l1[j];
        l1[j] = l1[j + 1];
        l1[j + 1] = temp;
        swap = true;
      }
      if (swap == false) {
        break;
      }
    }
  }
  print('sorted list:$l1');
}
