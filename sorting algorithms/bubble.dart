void main() {
  List l1 = [4, 5, 1, 2, 9, 3, 1, 0];
  print('original list:$l1');
  bool swap = false;
  for (int i = 0; i < l1.length; i++) {
    swap = false;
    for (int j = 0; j < l1.length - 1 - i; j++) {
      if (l1[j] > l1[j + 1]) {
        int temp = l1[j];
        l1[j] = l1[j + 1];
        l1[j + 1] = temp;
        swap = true;
      }
    }
    if (swap == false) {
      break;
    }
  }
  print('sorted list:$l1');
}
