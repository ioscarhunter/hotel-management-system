import 'package:isar/isar.dart';
import 'package:tuple/tuple.dart';

part 'room.g.dart';

@collection
class Room {
  Room(this.number, this.floor);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  final String number;

  final String floor;

  String get roomName => floor + number;

  @Index(type: IndexType.value, unique: true)
  int? bookingTransactionId;

  @override
  String toString() => roomName;
}

extension RoomExtension on Room {
  static Tuple2<String, String> splitRoomName(String roomName) {
    return Tuple2(roomName.substring(0, 1), roomName.substring(1));
  }
}
