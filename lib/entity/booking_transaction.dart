import 'package:isar/isar.dart';

part 'booking_transaction.g.dart';

@collection
class BookingTransaction {
  BookingTransaction(this.roomId, this.guestId, this.keyCardId);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value, unique: true)
  final int roomId;
  @Index(type: IndexType.value)
  final int guestId;
  @Index(type: IndexType.value, unique: true)
  final int keyCardId;
}
