class Node<K, V> {
  K key;
  V value;
  Node<K, V>? next;

  Node(this.key, this.value);
}

class Hashtable<K, V> {
  late List<Node<K, V>?> _slot;
  late int _capacity;

  Hashtable([int initialcapacity = 16]) {
    _capacity = initialcapacity;
    _slot = List<Node<K, V>?>.generate(_capacity, (index) {
      return null;
    });
  }
  hash(K key) {
    return key.hashCode % _capacity;
  }

  insert(K key, V value) {
    int index = hash(key);
    Node<K, V>? node = _slot[index];

    if (node == null) {
      _slot[index] = Node(key, value);
      return;
    }
    while (node != null) {
      if (node.key == key) {
        node.value = value;
        return;
      }
      if (node.next == null) {
        node.next = Node(key, value);

        return;
      }
      node = node.next;
    }
  }
}
