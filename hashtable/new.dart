class Node<K, V> {
  K key;
  V value;
  Node<K, V>? next;

  Node(this.key, this.value);
}

class HashTable<K, V> {
  List<Node<K, V>?> _buckets;
  int _size;

  HashTable([int initialCapacity = 16])
      : _buckets = List<Node<K, V>?>.generate(initialCapacity, (index) {
          return null;
        }),
        _size = 0;

  int _hash(K key) {
    return key.hashCode % _buckets.length;
  }

  void put(K key, V value) {
    int index = _hash(key);
    Node<K, V>? node = _buckets[index];

    if (node == null) {
      _buckets[index] = Node(key, value);
      _size++;
      return;
    }

    while (node != null) {
      if (node.key == key) {
        node.value = value;
        return;
      }
      if (node.next == null) {
        node.next = Node(key, value);
        _size++;
        return;
      }
      node = node.next;
    }
  }

  V? get(K key) {
    int index = _hash(key);
    Node<K, V>? node = _buckets[index];

    while (node != null) {
      if (node.key == key) {
        return node.value;
      }
      node = node.next;
    }

    return null;
  }

  V? remove(K key) {
    int index = _hash(key);
    Node<K, V>? node = _buckets[index];
    Node<K, V>? prev;

    while (node != null) {
      if (node.key == key) {
        if (prev == null) {
          _buckets[index] = node.next;
        } else {
          prev.next = node.next;
        }
        _size--;
        return node.value;
      }
      prev = node;
      node = node.next;
    }

    return null;
  }

  int get size => _size;

  bool get isEmpty => _size == 0;
}
