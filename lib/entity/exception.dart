import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/room.dart';

class DataNotFoundException implements Exception {}

class RoomOccupiedException implements Exception {
  RoomOccupiedException(this.room, this.bookingGuestName, this.bookedGuest);

  final Room room;
  final String bookingGuestName;
  final Guest bookedGuest;

  @override
  String toString() =>
      'Cannot book room $room for $bookingGuestName, The room is currently booked by ${bookedGuest.name}.';
}

class RoomFullException implements Exception {
  @override
  String toString() => 'No vacancy.';
}

class RoomNotFoundException implements Exception {
  RoomNotFoundException(this.roomName);

  final String roomName;

  @override
  String toString() => 'Room $roomName not found.';
}

class InformationMismatchException implements Exception {
  InformationMismatchException(this.bookedGuest, this.keyCardName);

  final Guest bookedGuest;
  final String keyCardName;

  @override
  String toString() => 'Only ${bookedGuest.name} can checkout with keycard number $keyCardName.';
}

class FloorNotAvailableException implements Exception {
  FloorNotAvailableException(this.floor, this.guestName);

  final String floor;
  final String guestName;

  @override
  String toString() => 'Cannot book floor $floor for $guestName.';
}
