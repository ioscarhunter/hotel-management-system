import 'package:hotel_management_system/entity/booking_transaction.dart';
import 'package:hotel_management_system/entity/exception.dart';
import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/repository/booking_data_repository.dart';
import 'package:hotel_management_system/repository/booking_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

import 'booking_repository_test.mocks.dart';

@GenerateMocks([BookingDataRepository])
void main() {
  late BookingDataRepository dataRepository;
  late BookingRepository sut;

  setUp(() {
    dataRepository = MockBookingDataRepository();
    sut = BookingRepository(dataRepository);
  });

  group('checkIn', () {
    final Room room = Room('16', '4')..id = 1;
    final BookingTransaction bookingTransaction = BookingTransaction();
    final Guest guest = Guest('name', 1);
    final KeyCard keyCard = KeyCard('1');

    test('should return keyCard when room is available', () async {
      when(dataRepository.getRoomByName(room.roomName)).thenAnswer((_) => Future.value(room));
      when(dataRepository.getBookingTransactionByRoomId(room.id)).thenAnswer((_) => Future.value(null));
      when(dataRepository.createGuest(guest.name, guest.age)).thenAnswer((_) => Future.value(guest));
      when(dataRepository.getFirstUnoccupiedKeyCard()).thenAnswer((_) => Future.value(keyCard));
      when(dataRepository.createBookingTransaction(guest, keyCard, room)).thenAnswer((_) => Future.value(keyCard));

      final KeyCard result = await sut.checkIn(guest.name, guest.age, room.roomName);

      expect(result, equals(keyCard));
    });

    test('should thrown RoomOccupiedException when room is not available', () async {
      when(dataRepository.getRoomByName(room.roomName)).thenAnswer((_) => Future.value(room));
      when(dataRepository.getBookingTransactionByRoomId(room.id)).thenAnswer((_) => Future.value(bookingTransaction));
      when(dataRepository.getGuestFromBookingTransaction(bookingTransaction)).thenAnswer((_) => guest);
      when(dataRepository.getFirstUnoccupiedKeyCard()).thenAnswer((_) => Future.value(keyCard));
      when(dataRepository.createBookingTransaction(guest, keyCard, room)).thenAnswer((_) => Future.value(keyCard));

      dynamic threwException;

      try {
        await sut.checkIn(guest.name, guest.age, room.roomName);
      } catch (exception) {
        threwException = exception;
      } finally {
        expect(threwException, isA<RoomOccupiedException>());
      }
    });
  });

  group('checkOut', () {
    final Room room = Room('16', '4')..id = 1;
    final BookingTransaction bookingTransaction = BookingTransaction();
    final Guest guest1 = Guest('name1', 1);
    final Guest guest2 = Guest('name2', 2);
    final KeyCard keyCard1 = KeyCard('1');
    final KeyCard keyCard2 = KeyCard('2');

    test('should return room when keyCard and name match', () async {
      when(dataRepository.getBookingTransactionByKeyCardName(keyCard1.name))
          .thenAnswer((_) => Future.value(bookingTransaction));
      when(dataRepository.getGuestFromBookingTransaction(bookingTransaction)).thenAnswer((_) => guest1);
      when(dataRepository.getKeyCardByName(keyCard1.name)).thenAnswer((_) => Future.value(keyCard1));
      when(dataRepository.deleteBookingTransaction(bookingTransaction, keyCard1)).thenAnswer((_) => Future.value(room));

      final Room result = await sut.checkOut(guest1.name, keyCard1.name);
      expect(result, equals(room));
    });

    test('should thrown InformationMismatchException when name not match', () async {
      when(dataRepository.getBookingTransactionByKeyCardName(keyCard1.name))
          .thenAnswer((_) => Future.value(bookingTransaction));
      when(dataRepository.getGuestFromBookingTransaction(bookingTransaction)).thenAnswer((_) => guest1);

      dynamic threwException;

      try {
        await sut.checkOut(guest2.name, keyCard1.name);
      } catch (exception) {
        threwException = exception;
      } finally {
        expect(threwException, isA<InformationMismatchException>());
      }
    });
  });

  group('checkInByFloor', () {
    final Room room1 = Room('16', '4')..id = 1;
    final Room room2 = Room('16', '4')..id = 2;
    final List<Room> rooms = [room1, room2];

    final Guest guest = Guest('name', 1);

    final KeyCard keyCard1 = KeyCard('1');
    final KeyCard keyCard2 = KeyCard('2');

    final List<KeyCard> keyCards = [keyCard1, keyCard2];

    final String floor = '4';

    final Tuple2<List<KeyCard>, List<Room>> keyCardsAndRooms = Tuple2(keyCards, rooms);

    test('should thrown FloorNotAvailableException when when floor not available', () async {
      when(dataRepository.isFloorAvailable(floor)).thenAnswer((_) => Future.value(false));

      dynamic threwException;

      try {
        await sut.checkInByFloor(floor, guest.name, guest.age);
      } catch (exception) {
        threwException = exception;
      } finally {
        expect(threwException, isA<FloorNotAvailableException>());
      }
    });

    test('should return keyCards and rooms when floor available', () async {
      when(dataRepository.isFloorAvailable(floor)).thenAnswer((_) => Future.value(true));
      when(dataRepository.getRoomByFloor(floor)).thenAnswer((_) => Future.value(rooms));
      when(dataRepository.getNumberOfUnoccupiedKeyCard(rooms.length)).thenAnswer((_) => Future.value(keyCards));
      when(dataRepository.createGuest(guest.name, guest.age)).thenAnswer((_) => Future.value(guest));
      when(dataRepository.createBookingTransactions(guest, rooms))
          .thenAnswer((realInvocation) => Future.value(keyCards));

      final Tuple2<List<KeyCard>, List<Room>> result = await sut.checkInByFloor(floor, guest.name, guest.age);
      expect(result, equals(keyCardsAndRooms));
    });
  });
}
