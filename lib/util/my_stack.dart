class MyStack<int> {
  final _list = <int>[];
  bool isEmpty() => _list.isEmpty;

  void push(int value) => _list.add(value);
  int? pop() => isEmpty() ? null : _list.removeLast();
}
