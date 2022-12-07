import 'package:hotel_management_system/entity/booking_transaction.dart';
import 'package:isar/isar.dart';

part 'key_card.g.dart';

@collection
class KeyCard {
  KeyCard(this.name);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value, unique: true)
  final String name;

  @Backlink(to: 'keyCard')
  final IsarLink<BookingTransaction> bookingTransaction = IsarLink();

  @override
  String toString() => name;
}
