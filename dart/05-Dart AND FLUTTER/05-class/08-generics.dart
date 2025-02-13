class DataStorage<T> {
  List<T> _items = []; 

  void addItem(T item) {
    _items.add(item);
  }

  void removeItem(T item) {
    _items.remove(item);
  }

  T? getItem(int index) {
    if (index < _items.length) {
      return _items[index];
    }
    return null;
  }

  List<T> getAllItems() => List.from(_items);

  int get length => _items.length;
  
  void clear() {
    _items.clear();
  }
}

void main() {
  var names = DataStorage<String>();
  names.addItem('John');
  names.addItem('Doe');
  names.addItem('Smith');
  names.removeItem('Doe');
  print(names.getAllItems());

  var numbers = DataStorage<int>();
  numbers.addItem(1);
  numbers.addItem(2);
  numbers.addItem(3);
  numbers.removeItem(2);
}