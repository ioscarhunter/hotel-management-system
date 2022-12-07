import 'package:hotel_management_system/entity/booking_transaction.dart';
import 'package:hotel_management_system/entity/exception.dart';
import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/service/local_data_service.dart';
import 'package:isar/isar.dart';
import 'package:tuple/tuple.dart';

class BookingDataRepository {
  BookingDataRepository(this.localDataService);

  final LocalDataService localDataService;

  IsarCollection<BookingTransaction> get bookingTransactions => localDataService.isar.bookingTransactions;

  IsarCollection<Guest> get guests => localDataService.isar.guests;

  IsarCollection<KeyCard> get keyCards => localDataService.isar.keyCards;

  IsarCollection<Room> get rooms => localDataService.isar.rooms;

  Future<void> createRoom(List<Room> rooms) {
    return localDataService.isar.writeTxn(() => this.rooms.putAll(rooms));
  }

  Future<void> createKeyCard(List<KeyCard> keyCards) {
    return localDataService.isar.writeTxn(() => this.keyCards.putAll(keyCards));
  }

  Future<Guest> createGuest(String name, int age) async {
    Guest? guest = await getGuestByName(name);
    if (guest != null) return guest;

    return localDataService.isar.writeTxn(() {
      return guests.put(Guest(name, age)).then((id) => guests.get(id)).then((guest) => guest!);
    });
  }

  Future<KeyCard> createBookingTransaction(
    Guest guest,
    KeyCard keyCard,
    Room room,
  ) {
    return localDataService.isar.writeTxn(() async {
      final BookingTransaction bookingTransaction = BookingTransaction();
      final int bookingId = await bookingTransactions.put(bookingTransaction);

      bookingTransaction.guest.value = guest;
      await bookingTransaction.guest.save();
      bookingTransaction.keyCard.value = keyCard;
      await bookingTransaction.keyCard.save();
      bookingTransaction.room.value = room;
      await bookingTransaction.room.save();

      // await Future.wait([
      //   keyCards.put(keyCard..bookingTransactionId = bookingId),
      //   rooms.put(room..bookingTransactionId = bookingId),
      // ]);
      return bookingTransaction.keyCard.value!;
    });
  }

  Future<Room> deleteBookingTransaction(BookingTransaction bookingTransaction, KeyCard keyCard) async {
    final Room room = bookingTransaction.room.value!;
    await localDataService.isar.writeTxn(() {
      return Future.wait([
        bookingTransactions.delete(bookingTransaction.id),
        // keyCards.put(keyCard..bookingTransactionId = null),
        // rooms.put(room.bookingTransaction.value = null),
      ]);
    });
    return room;
  }

  Future<BookingTransaction?> getBookingTransactionByRoomId(int roomId) {
    return bookingTransactions.filter().room((q) => q.idEqualTo(roomId)).findFirst();
  }

  Future<BookingTransaction> getBookingTransactionByKeyCardName(String keyCardName) async {
    // KeyCard keyCard = await getKeyCardByName(keyCardName);
    return bookingTransactions.filter().keyCard((q) => q.nameEqualTo(keyCardName)).findFirst().then((value) => value!);
  }

  Future<Guest?> getGuestByName(String guestName) {
    return guests.getByName(guestName);
  }

  Future<Guest> getGuestById(int id) {
    return guests.get(id).then((value) => value!);
  }

  Guest getGuestFromBookingTransaction(BookingTransaction bookingTransaction) {
    return bookingTransaction.guest.value!;
  }

  Future<Room> getRoomByNumber(String roomNumber) {
    final Tuple2<String, String> roomFloorAndNumber = RoomExtension.splitRoomName(roomNumber);

    return rooms
        .filter()
        .floorEqualTo(roomFloorAndNumber.item1)
        .and()
        .numberEqualTo(roomFloorAndNumber.item2)
        .findFirst()
        .then((value) {
      if (value == null) throw RoomNotFoundException(roomNumber);
      return value;
    });
  }

  Future<Room> getRoomById(int id) {
    return rooms.get(id).then((value) => value!);
  }

  Future<KeyCard> getKeyCardById(int id) {
    return keyCards.get(id).then((value) => value!);
  }

  Future<KeyCard> getKeyCardByName(String name) {
    return keyCards.getByName(name).then((value) => value!);
  }

  Future<KeyCard> getFirstUnoccupiedKeyCard() {
    return keyCards.filter().bookingTransactionIsNull().findFirst().then((value) {
      if (value == null) throw RoomFullException();
      return value;
    });
  }

  Future<List<Room>> getAvailableRoom() {
    return rooms.filter().bookingTransactionIsNull().findAll();
  }

  Future<List<Guest>> getAllGuest() {
    return guests.filter().bookingTransactionIsNotEmpty().findAll();
  }

  Future<List<Guest>> getAllGuestAgeLessThan(int age) {
    return guests.filter().bookingTransactionIsNotEmpty().ageLessThan(age).findAll();
  }

  Future<List<Guest>> getAllGuestAgeGreaterThan(int age) {
    return guests.filter().bookingTransactionIsNotEmpty().ageGreaterThan(age).findAll();
  }

  Future<List<Guest>> getAllGuestAgeEqualTo(int age) {
    return guests.filter().bookingTransactionIsNotEmpty().ageEqualTo(age).findAll();
  }

  Future<List<Guest>> getAllGuestByFloor(String floor) {
    return bookingTransactions
        .filter()
        .room((q) => q.floorEqualTo(floor))
        .findAll()
        .then((bookings) => bookings.map((booking) => booking.guest.value!).toList());
  }

  Future<Guest> getGuestByRoom(String roomNumber) {
    return getRoomByNumber(roomNumber)
        .then((room) => bookingTransactions.filter().room((q) => q.idEqualTo(room.id)).findFirst())
        .then((booking) => booking!.guest.value!);
  }

  Future<void> clearData() {
    return localDataService.isar.clear();
  }
}
