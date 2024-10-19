class Stack {
  List _stack = [];
  push(int data) {
    _stack.add(data);
  }

  pop() {
    if (isempty)
      print('empty!');
    else
      return _stack.removeLast();
  }

  peek() {
    if (isempty)
      print('empty list!');
    else
      return _stack.last;
  }

  display() {
    print(_stack.reversed);
  }

  get isempty {
    return _stack.isEmpty;
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
    if (isempty || peek() < data) {
      push(data);
      return;
    }
    int top = pop();
    insert2(data);
    push(top);
  }
}

void main() {
  Stack st = Stack();
  st.push(23);
  st.push(12);
  st.push(01);
  st.push(53);
  st.push(92);

  st.display();

  st.rev();
  st.display();
  st.sort();
  st.display();
}
