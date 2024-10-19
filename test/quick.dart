quick(List l1) {
  if (l1.length <= 1) return l1;
  List left = [];
  List right = [];
  List middle = [];
  int pivot = l1[0];

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
  List l1 = [9, 3, 1, 89, 12, 67];
  print('List: $l1');
  List l2 = quick(l1);
  print('sorted list:$l2');
}
