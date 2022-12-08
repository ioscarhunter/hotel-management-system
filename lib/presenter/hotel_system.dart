import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/presenter/list_extension.dart';
import 'package:hotel_management_system/repository/booking_repository.dart';

class HotelSystem {
  HotelSystem(this.repository);

  final BookingRepository repository;

  Future<String> initHotel(int floorCount, int roomPerFloorCount) {
    final List<Room> rooms = [];
    for (int floor = 1; floor <= floorCount; floor++) {
      for (int room = 1; room <= roomPerFloorCount; room++) {
        rooms.add(Room(room.toString().padLeft(2, '0'), '$floor'));
      }
    }

    List<KeyCard> keyCards = [];

    for (int cardName = 1; cardName <= floorCount * roomPerFloorCount; cardName++) {
      keyCards.add(KeyCard('$cardName'));
    }

    return Future.wait([repository.createRoom(rooms), repository.createKeyCard(keyCards)])
        .then((values) => 'Hotel created with $floorCount floor(s), $roomPerFloorCount room(s) per floor.');
  }

  Future<String> checkIn(String guestName, int age, String roomNumber) {
    return repository
        .checkIn(guestName, age, roomNumber)
        .then((keyCard) => 'Room $roomNumber is booked by $guestName with keycard number ${keyCard.name}.');
  }

  Future<String> checkout(String guestName, String keyCardName) {
    return repository.checkOut(guestName, keyCardName).then((room) => 'Room $room is checkout.');
  }

  Future<String> getAvailableRoom() {
    return repository.getAvailableRoom().then((rooms) => rooms.format);
  }

  Future<String> getAllGuest() {
    return repository.getAllGuest().then((guests) => guests.format);
  }

  Future<String> getAllGuestByAge(int age, String operator) {
    return _getAllGuestByAge(age, operator).then((guests) => guests.format);
  }

  Future<List<Guest>> _getAllGuestByAge(int age, String operator) {
    switch (operator) {
      case '<':
        return repository.getAllGuestAgeLessThan(age);
      case '>':
        return repository.getAllGuestAgeGreaterThan(age);
      case '=':
        return repository.getAllGuestAgeEqualTo(age);
    }
    return Future.value([]);
  }

  Future<String> getAllGuestByFloor(String floor) {
    return repository.getAllGuestByFloor(floor).then((guests) => guests.format);
  }

  Future<String> getGuestByRoom(String roomNumber) {
    return repository.getGuestByRoom(roomNumber).then((guest) => guest.name);
  }

  Future<String> checkOutByFloor(String floor) {
    return repository.checkOutByFloor(floor).then((rooms) => 'Room ${rooms.format} are checkout.');
  }

  Future<String> checkInByFloor(String floor, String guestName, int age) {
    return repository
        .checkInByFloor(floor, guestName, age)
        .then((result) => 'Room ${result.item2.format} are booked with keycard number ${result.item1.format}');
  }
}
