import 'package:hotel_management_system/entity/room.dart';
import 'package:test/test.dart';

class RoomMatcher extends Matcher {
  RoomMatcher(this.expected);

  final Room expected;

  @override
  Description describe(Description description) {
    return description.add('Room: expect $expected');
  }

  @override
  bool matches(item, Map matchState) {
    if (item.runtimeType != Room) {
      return false;
    }

    final Room actual = item as Room;

    return actual.number == expected.number && actual.floor == expected.floor;
  }
}

Matcher getRoomsMatcher(List<Room> expected) => pairwiseCompare<Room, Room>(
    expected, (expected, actual) => RoomMatcher(expected).matches(actual, {}), 'compare Rooms');
