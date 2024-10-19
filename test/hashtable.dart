class HashNode<K, V> {
  K key;
  V value;

  HashNode(this.key, this.value);
}

class Hashtable<K, V> {
  late int _capacity;
  late List<List<HashNode<K, V>>> _slot;
  late int _size;

  Hashtable([int initialcapacity = 16]) {
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
        return;
      }
    }
    _slot[index].add(HashNode(key, value));
    _size++;
  }

  retrieve(K key) {
    int index = hash(key);
    for (var node in _slot[index]) {
      if (node.key == key) {
        return node.value;
      }
    }
  }

  findmax() {
    if (_size == 0) return;
    K? maxchar;
    int maxcount = 0;

    for (var slot in _slot) {
      for (var node in slot) {
        int value1 = node.value as int;
        if (value1 > maxcount) {
          maxchar = node.key;
          maxcount = node.value as int;
        }
      }
    }
    print('character:$maxchar count:$maxcount');
  }
}

void main() {
  Hashtable h = Hashtable();
  String s = 'hellohh';
  List s1 = s.split('');
  for (var char in s1) {
    int count = h.retrieve(char) ?? 0;
    h.insert(char, count + 1);
  }
  var find = h.retrieve('h');
  print(find);
  h.findmax();
}
