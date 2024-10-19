class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;

  // Insert a node at the end of the list
  insert(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = tail = newNode;
    } else {
      tail?.next = newNode;
      tail = newNode;
    }
  }

  // Display the entire linked list
  display() {
    if (head == null) {
      print('List is empty!');
    } else {
      Node? current = head;
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }

  getmiddle(Node? head) {
    if (head == null) return head;
    Node? slow = head;
    Node? fast = head.next;

    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }
    return slow;
  }

  mergesort(Node? head) {
    if (head == null || head.next == null) {
      return head;
    }
    Node? middle = getmiddle(head);
    Node? nextmiddle = middle!.next;
    middle.next = null;

    Node? left = mergesort(head);
    Node? right = mergesort(nextmiddle);

    return merge(left, right);
  }

  merge(Node? left, Node? right) {
    if (left == null) return right;
    if (right == null) return left;
    Node? result;
    if (left.data <= right.data) {
      result = left;
      result.next = merge(left.next, right);
    } else {
      result = right;
      result.next = merge(left, right.next);
    }

    return result;
  }
}

void main() {
  LinkedList list = LinkedList();

  // Insert elements into the linked list
  list.insert(23);
  list.insert(45);
  list.insert(67);
  list.insert(12);
  list.insert(78);
  list.insert(80);
  list.insert(10);

  print("Unsorted List:");
  list.display();
  list.head = list.mergesort(list.head);
  print("\nSorted List:");
  list.display();
}
