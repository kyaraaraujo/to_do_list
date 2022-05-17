final _list = <String>[];

List<String> myList() {
  return _list;
}

void addToList(String textInput) {
  _list.add(textInput);
}

void removeFromList(int index) {
  _list.removeAt(index);
}
