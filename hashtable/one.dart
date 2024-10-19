class HashNode<K, V> {
  K key;
  V value;

  HashNode(this.key, this.value);
}

class HashTable<K, V> {
  late List<List<HashNode<K, V>>> _slot;
  late int _size;
  late int _capacity;

  HashTable([int initialcapacity = 16]) {
    _capacity = initialcapacity;
    _size = 0;
    _slot = List.generate(_capacity, (index) {
      return [];
    });
  }

  int hash(K key) {
    return key.hashCode % _capacity;
  }

  insert(K key, V value) {
    int index = hash(key);
    for (var node in _slot[index]) {
      if (node.key == key) {
        node.value = value;
        return;
      }
    }
    _slot[index].add(HashNode(key, value));
    _size++;

    if (_size / _capacity > 0.75) {
      _resize();
    }
  }

  retrieve(K key) {
    int index = hash(key);
    for (var node in _slot[index]) {
      if (node.key == key) {
        return node.value;
      }
    }
    print('not find!');
  }

  _resize() {
    int newCapacity = _capacity * 2;
    List<List<HashNode<K, V>>> newSlot = List.generate(newCapacity, (index) {
      return [];
    });

    for (var slot in _slot) {
      for (var node in slot) {
        int newIndex = node.key.hashCode % newCapacity;
        newSlot[newIndex].add(node);
      }
    }

    _slot = newSlot;
    _capacity = newCapacity;
  }

  display() {
    for (int i = 0; i < _capacity; i++) {
      if (!_slot[i].isEmpty) {
        print("Slot:$i");
        for (var node in _slot[i]) {
          print("  ${node.key}:${node.value}");
        }
      }
    }
  }
}

void main() {
  HashTable h = HashTable();
  h.insert('one', 10);
  h.insert('two', 20);
  h.insert('three', 30);
  h.insert('four', 30);
  var find = h.retrieve('four');
  print('Found $find');

  h.display();
}
