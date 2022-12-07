import 'dart:io';

import 'package:hotel_management_system/entity/booking_transaction.dart';
import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:isar/isar.dart';

class LocalDataService {
  LocalDataService();

  static const _name = 'LocalData';

  late Isar _isar;

  Isar get isar => _isar;

  final List<CollectionSchema> schemas = [
    BookingTransactionSchema,
    GuestSchema,
    KeyCardSchema,
    RoomSchema,
  ];

  Future<void> initIsar() async {
    _isar = await Isar.open(schemas, directory: Directory.current.path, name: _name);
  }
}
