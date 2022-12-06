import 'package:isar/isar.dart';

part 'room.g.dart';

@collection
class Room {
  Room(this.name, this.floor);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  final String name;

  final String floor;
}
