import 'package:hotel_management_system/entity/booking_transaction.dart';
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

  Future<BookingTransaction?> getBookingTransactionsByRoomId(int roomId) {
    return bookingTransactions.getByRoomId(roomId);
  }

  Future<Guest?> getGuestByName(String guestName) {
    return guests.filter().nameEqualTo(guestName).findFirst();
  }

  Future<Guest?> getGuestById(int id) {
    return guests.get(id);
  }

  Future<Room?> getRoomByNumber(String roomNumber) {
    final Tuple2<String, String> roomFloorAndNumber = RoomExtension.splitRoomName(roomNumber);

    return rooms
        .filter()
        .floorEqualTo(roomFloorAndNumber.item1)
        .and()
        .numberEqualTo(roomFloorAndNumber.item2)
        .findFirst();
  }

  Future<Room?> getRoomById(int id) {
    return rooms.get(id);
  }
}
