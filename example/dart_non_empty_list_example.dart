import 'package:dart_non_empty_list/dart_non_empty_list.dart';

void main() {
  var list = NonEmptyList(1, [2, 3, 4, 5]);
  print('list: $list');

  final NonEmptyList<String> stringList = list.map((n) => 'number: $n');
  print('list: $stringList');

  try {
    // runtime error
    NonEmptyList.unsafe([]);
  } catch (e) {
    print(e);
  }
}
