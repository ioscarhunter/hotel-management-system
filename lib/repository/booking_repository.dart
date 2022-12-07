import 'package:hotel_management_system/entity/booking_transaction.dart';
import 'package:hotel_management_system/entity/exception.dart';
import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/repository/booking_data_repository.dart';
import 'package:hotel_management_system/service/local_data_service.dart';
import 'package:isar/isar.dart';
import 'package:tuple/tuple.dart';

class BookingRepository {
  BookingRepository(this.dataRepository);

  final BookingDataRepository dataRepository;

  Future<void> book(Guest bookingGuest, String roomNumber) async {
    Room? room = await dataRepository.getRoomByNumber(roomNumber);
    BookingTransaction? query = await dataRepository.getBookingTransactionsByRoomId(room!.id);
    if (query != null) {
      Guest? bookedGuest = await dataRepository.getGuestById(query.guestId);
      throw RoomOccupiedException(room, bookingGuest, bookedGuest!);
    }
    return localDataService.isar.writeTxn(() => bookingTransactions.put(bookingTransaction));
  }

  Future<void> checkOut(String guestName, int keyCardId) async {
    BookingTransaction? query = await bookingTransactions.getByRoomId(bookingTransaction.roomId);

    return localDataService.isar.writeTxn(() => bookingTransactions.delete(bookingTransaction));
  }
}
