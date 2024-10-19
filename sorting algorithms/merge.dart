merge(List l1) {
  if (l1.length <= 1) return;
  int mid = l1.length ~/ 2;
  List left = l1.sublist(0, mid);
  List right = l1.sublist(mid);

  merge(left);
  merge(right);

  mergesort(left, right, l1);
}

mergesort(List left, List right, List result) {
  int i = 0, j = 0, k = 0;
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result[k] = left[i];
      i++;
      k++;
    } else {
      result[k] = right[j];
      j++;
      k++;
    }
  }
  while (i < left.length) {
    result[k] = left[i];
    i++;
    k++;
  }
  while (j < right.length) {
    result[k] = right[j];
    j++;
    k++;
  }
}

void main() {
  List l1 = [4, 5, 1, 2, 9, 3, 1, 0];
  print('original list:$l1');
  merge(l1);
  print('sorted list:$l1');
}
