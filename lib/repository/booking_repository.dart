import 'package:hotel_management_system/entity/booking_transaction.dart';
import 'package:hotel_management_system/entity/exception.dart';
import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/repository/booking_data_repository.dart';

class BookingRepository {
  BookingRepository(this.dataRepository);

  final BookingDataRepository dataRepository;

  Future<void> createRoom(List<Room> rooms) {
    return dataRepository.createRoom(rooms);
  }

  Future<void> createKeyCard(List<KeyCard> keyCards) {
    return dataRepository.createKeyCard(keyCards);
  }

  Future<KeyCard> checkIn(String guestName, int age, String roomNumber) async {
    final Room room = await dataRepository.getRoomByNumber(roomNumber);
    final BookingTransaction? query = await dataRepository.getBookingTransactionByRoomId(room.id);

    if (query != null) {
      final Guest bookedGuest = dataRepository.getGuestFromBookingTransaction(query);
      throw RoomOccupiedException(room, guestName, bookedGuest);
    }

    final Guest bookingGuest = await dataRepository.createGuest(guestName, age);
    final KeyCard keyCard = await dataRepository.getFirstUnoccupiedKeyCard();

    return dataRepository.createBookingTransaction(
      bookingGuest,
      keyCard,
      room,
    );
  }

  Future<Room> checkOut(String guestName, String keyCardName) async {
    final BookingTransaction bookingTransaction = await dataRepository.getBookingTransactionByKeyCardName(keyCardName);
    final Guest bookedGuest = dataRepository.getGuestFromBookingTransaction(bookingTransaction);

    if (bookedGuest.name != guestName) {
      throw InformationMismatchException(bookedGuest, keyCardName);
    }

    final KeyCard keyCard = await dataRepository.getKeyCardByName(keyCardName);
    return dataRepository.deleteBookingTransaction(bookingTransaction, keyCard);
  }

  Future<List<Room>> getAvailableRoom() {
    return dataRepository.getAvailableRoom();
  }

  Future<List<Guest>> getAllGuest() {
    return dataRepository.getAllGuest();
  }

  Future<List<Guest>> getAllGuestAgeLessThan(int age) {
    return dataRepository.getAllGuestAgeLessThan(age);
  }

  Future<List<Guest>> getAllGuestAgeGreaterThan(int age) {
    return dataRepository.getAllGuestAgeGreaterThan(age);
  }

  Future<List<Guest>> getAllGuestAgeEqualTo(int age) {
    return dataRepository.getAllGuestAgeEqualTo(age);
  }

  Future<List<Guest>> getAllGuestByFloor(String floor) {
    return dataRepository.getAllGuestByFloor(floor);
  }

  Future<Guest> getGuestByRoom(String roomNumber) {
    return dataRepository.getGuestByRoom(roomNumber);
  }

  Future<void> clearData() {
    return dataRepository.clearData();
  }
}
