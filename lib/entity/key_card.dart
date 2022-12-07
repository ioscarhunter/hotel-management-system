import 'package:isar/isar.dart';

part 'key_card.g.dart';

@collection
class KeyCard {
  KeyCard(this.name);

  @Index(type: IndexType.value)
  Id id = Isar.autoIncrement;

  final String name;

  int? bookingTransactionId;
}
