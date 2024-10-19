class Queue {
  List _queue = [];

  enqueue(int data) {
    _queue.add(data);
  }

  dequeue() {
    if (isempty())
      print('list empty!');
    else
      return _queue.removeAt(0);
  }

  isempty() {
    return _queue.isEmpty;
  }
}
