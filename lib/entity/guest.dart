import 'package:isar/isar.dart';

part 'guest.g.dart';

@collection
class Guest {
  Guest(this.name, this.age);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  final String name;

  final int age;
}
