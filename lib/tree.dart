//
// References: https://www.raywenderlich.com/10971345-flutter-interview-questions-and-answers
//

import 'dart:collection';

final treeOne = Node(1, children: [
  Node(4, children: [
    Node(10),
    Node(12),
  ]),
  Node(3, children: [
    Node(3),
    Node(10),
    Node(1),
  ]),
]);

final treeTwo = Node(4, children: [
  Node(10),
  Node(3),
  Node(12),
]);

class UniqTree {
  void findAnswer() async {
    final uniqueOne = UniqueTreeItems().search(treeOne);
    final uniqueTwo = UniqueTreeItems().search(treeTwo);
    final answer = uniqueOne.where((element) => !uniqueTwo.contains(element));
    answer.forEach(print); // 1
  }
}

class Node {
  int data;
  List<Node> children;

  Node(this.data, {this.children});
}

class UniqueTreeItems {
  final Set<int> _uniqueIntegers = HashSet<int>();

  Set<int> search(Node tree) {
    _addInOrder(tree);
    return _uniqueIntegers;
  }

  void _addInOrder(Node node) {
    _uniqueIntegers.add(node.data);
    if (node.children == null) return;
    for (final child in node.children) {
      _addInOrder(child);
    }
  }
}
