class Stack {
  List _stack = [];
  List _stack2 = [];

  void push(int data) {
    _stack.add(data);
  }

  pop() {
    if (_stack.isEmpty) {
      print('Stack is empty!');
    } else {
      return _stack.removeLast();
    }
  }

  bool get isempty {
    return _stack.isEmpty;
  }

  length() {
    return _stack.length;
  }

  peek() {
    if (_stack.isEmpty) {
      print('stack is empty');
    } else {
      return _stack.last;
    }
  }

  display() {
    print(_stack.reversed);
  }

  rev() {
    if (isempty) return;
    int top = pop();
    rev();
    insert(top);
  }

  insert(int data) {
    if (isempty) {
      push(data);
      return;
    }
    int top = pop();
    insert(data);
    push(top);
  }

  sort() {
    if (isempty) return;
    int top = pop();
    sort();
    insert2(top);
  }

  insert2(int data) {
    if (isempty || peek() <= data) {
      push(data);
      return;
    }
    int top = pop();
    insert2(data);
    push(top);
  }

  queue(Stack og) {
    Stack stack = Stack();
    while (!og.isempty) {
      stack.push(og.pop());
    }
    return stack;
  }
}

void main() {
  Stack s = Stack();
  // s.peek();
  s.push(34);
  s.push(45);
  s.push(12);
  // int k = s.peek();
  //print('top element:$k');
  //s.display();
  //s.pop();
  s.display();
  s.rev();
  s.display();
  s.sort();
  s.display();
  Stack q = s.queue(s);
  print(q);
}
