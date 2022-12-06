import 'package:isar/isar.dart';

part 'booking_transaction.g.dart';

@collection
class BookingTransaction {
  BookingTransaction(this.roomId, this.guestId, this.keyCardId);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  final int roomId;
  final int guestId;
  final int keyCardId;
}
