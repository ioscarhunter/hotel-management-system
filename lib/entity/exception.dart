import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/room.dart';

class DataNotFoundException implements Exception {}

class RoomOccupiedException implements Exception {
  RoomOccupiedException(this.room, this.bookingGuest, this.bookedGuest);

  final Room room;
  final Guest bookingGuest;
  final Guest bookedGuest;

  @override
  String toString() =>
      'Cannot book room $room for ${bookingGuest.name}, The room is currently booked by ${bookedGuest.name}.';
}
