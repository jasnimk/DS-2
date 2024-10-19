class HashNode<K, V> {
  K key;
  V value;

  HashNode(this.key, this.value);
}

class HashTable<K, V> {
  late int _size;
  late int _capacity;
  late List<List<HashNode<K, V>>> _slot;

  HashTable([int initialcapacity = 16]) {
    _size = 0;
    _capacity = initialcapacity;
    _slot = List.generate(_capacity, (index) {
      return [];
    });
  }

  hash(K key) {
    return key.hashCode % _capacity;
  }

  void insert(K key, V value) {
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
      resize();
    }
  }

  display() {
    for (int i = 0; i < _capacity; i++) {
      if (!_slot[i].isEmpty) {
        for (var node in _slot[i]) {
          print("${node.key}:${node.value}");
        }
      }
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

  resize() {
    int newcapacity = _capacity * 2;
    List<List<HashNode<K, V>>> newSlot = List.generate(newcapacity, (index) {
      return [];
    });
    for (var slot in _slot) {
      for (var node in slot) {
        int newindex = node.key.hashCode % newcapacity;
        newSlot[newindex].add(node);
      }
    }
    _slot = newSlot;
    _capacity = newcapacity;
  }
}

void main() {
  HashTable h = HashTable();
  h.insert(1, 'one');
  h.insert(2, 'two');
  h.insert(3, 'three');
  h.display();
  var found = h.retrieve(4);
  print('Found $found');
}
