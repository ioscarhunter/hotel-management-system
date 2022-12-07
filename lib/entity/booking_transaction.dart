import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:isar/isar.dart';

part 'booking_transaction.g.dart';

@collection
class BookingTransaction {
  BookingTransaction();

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  final IsarLink<Room> room = IsarLink();
  final IsarLink<Guest> guest = IsarLink();
  final IsarLink<KeyCard> keyCard = IsarLink();
}
