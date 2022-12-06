import 'package:isar/isar.dart';

part 'room.g.dart';

@collection
class Room {
  Room(this.name, this.floor);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  final String name;

  final String floor;
}
