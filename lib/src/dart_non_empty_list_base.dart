// TODO: Put public facing types in this file.

import 'dart:collection';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

class NonEmptyList<E> extends IterableMixin<E>{
  final List<E> _values;

  NonEmptyList._(this._values);

  factory NonEmptyList.unsafe(Iterable<E> values) {
    if (values.isEmpty) ArgumentError('list should be nonEmpty');
    return NonEmptyList._(values.toList());
  }

  factory NonEmptyList(E head, Iterable<E> tail) {
    return NonEmptyList._([head, ...tail]);
  }

  @override
  Iterator<E> get iterator => _values.iterator;

  @override
  E get first => super.first;

  @override
  NonEmptyList<T> map<T>(T Function(E element) toElement) {
    return NonEmptyList.unsafe(super.map(toElement));
  }

  factory NonEmptyList.fromJson(Iterable<E> json) => NonEmptyList.unsafe(json);

  List<E> toJson() => _values;
}

void main() {
  final list = NonEmptyList<String>('OK', []).map((s) => s.length);
  print(list.toJson().toString());
}