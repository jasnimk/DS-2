class HashNode<K, V> {
  K key;
  V value;

  HashNode(this.key, this.value);
}

class HashTable<K, V> {
  late int _capacity;
  late int _size;
  late List<List<HashNode<K, V>>> _slot;

  HashTable([int initialcapacity = 16]) {
    _capacity = initialcapacity;
    _size = 0;
    _slot = List.generate(_capacity, (index) {
      return [];
    });
  }

  hash(K key) {
    return key.hashCode % _capacity;
  }

  insert(K key, V value) {
    int index = hash(key);
    for (var node in _slot[index]) {
      if (node.key == key) {
        node.value = value;
      }
    }
    _slot[index].add(HashNode(key, value));
    _size++;

    if (_size % _capacity > 0.75) {
      resize();
    }
  }

  retrieve(K key) {
    int index = hash(key);
    for (var node in _slot[index]) {
      if (node.key == key) {
        return node.value;
      }
    }
  }

  display() {
    for (int i = 0; i < _capacity; i++) {
      if (!_slot[i].isEmpty) {
        for (var node in _slot[i]) {
          print('${node.key}:${node.value}');
        }
      }
    }
  }

  resize() {
    int newcapacity = _capacity * 2;
    List newSlot = List.generate(newcapacity, (index) {
      return [];
    });
    for (var slot in _slot) {
      for (var node in slot) {
        int newindex = node.key.hashCode % newcapacity;
        newSlot[newindex].add(node);
      }
    }
  }
}
