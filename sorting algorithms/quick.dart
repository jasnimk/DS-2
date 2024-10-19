quick(List l1) {
  if (l1.length <= 1) return l1;
  List left = [];
  List right = [];
  List middle = [];
  int pivot = l1[l1.length - 1];

  for (var val in l1) {
    if (val < pivot)
      left.add(val);
    else if (val > pivot)
      right.add(val);
    else
      middle.add(val);
  }
  return quick(left) + middle + quick(right);
}

void main() {
  List l1 = [4, 5, 1, 2, 9, 3, 1, 0];
  print('original list:$l1');

  List result = quick(l1);
  print('sorted list:$result');
}
