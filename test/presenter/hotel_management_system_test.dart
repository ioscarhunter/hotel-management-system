import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/presenter/hotel_system.dart';
import 'package:hotel_management_system/repository/booking_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../matcher/key_card_matcher.dart';
import '../matcher/room_matcher.dart';
import 'hotel_management_system_test.mocks.dart';

@GenerateMocks([BookingRepository])
void main() {
  late MockBookingRepository repository;
  late HotelSystem sut;

  setUp(() {
    repository = MockBookingRepository();
    sut = HotelSystem(repository);
  });

  group('initHotel', () {
    final int floorCount = 2, roomPerFloorCount = 3;

    final List<Room> rooms = [
      Room('1', '1'),
      Room('1', '2'),
      Room('1', '3'),
      Room('2', '1'),
      Room('2', '2'),
      Room('2', '3'),
    ];

    final List<KeyCard> keyCards = List.generate(floorCount * roomPerFloorCount, (index) => KeyCard('${index + 1}'));

    test('should call repository with correct quantity', () async {
      when(repository.createRoom(argThat(getRoomsMatcher(rooms)))).thenAnswer((_) => Future.value());
      when(repository.createKeyCard(argThat(getKeyCardsMatcher(keyCards)))).thenAnswer((_) => Future.value());

      await sut.initHotel(floorCount, roomPerFloorCount);
    });
  });

  group('getAllGuestByAge', () {
    final int floorCount = 2, roomPerFloorCount = 3;

    List<Room> rooms = [
      Room('1', '1'),
      Room('1', '2'),
      Room('1', '3'),
      Room('2', '1'),
      Room('2', '2'),
      Room('2', '3'),
    ];

    List<KeyCard> keyCards = List.generate(floorCount * roomPerFloorCount, (index) => KeyCard('${index + 1}'));

    test('should call repository with correct quantity', () async {
      when(repository.createRoom(argThat(getRoomsMatcher(rooms)))).thenAnswer((_) => Future.value());
      when(repository.createKeyCard(argThat(getKeyCardsMatcher(keyCards)))).thenAnswer((_) => Future.value());

      await sut.initHotel(floorCount, roomPerFloorCount);
    });
  });

  group('getAllGuestByAge', () {
    final List<Guest> guests = [Guest('name1', 1), Guest('name2', 2)];
    final int age = 10;

    test('should call getAllGuestAgeLessThan when operator is <', () async {
      when(repository.getAllGuestAgeLessThan(age)).thenAnswer((_) => Future.value(guests));

      await sut.getAllGuestByAge(age, '<');

      verify(repository.getAllGuestAgeLessThan(age)).called(1);
      verifyNever(repository.getAllGuestAgeGreaterThan(age));
      verifyNever(repository.getAllGuestAgeEqualTo(age));
    });

    test('should call getAllGuestAgeGreaterThan when operator is >', () async {
      when(repository.getAllGuestAgeGreaterThan(age)).thenAnswer((_) => Future.value(guests));

      await sut.getAllGuestByAge(age, '>');

      verifyNever(repository.getAllGuestAgeLessThan(age));
      verify(repository.getAllGuestAgeGreaterThan(age)).called(1);
      verifyNever(repository.getAllGuestAgeEqualTo(age));
    });

    test('should call getAllGuestAgeEqualTo when operator is =', () async {
      when(repository.getAllGuestAgeEqualTo(age)).thenAnswer((_) => Future.value(guests));

      await sut.getAllGuestByAge(age, '=');

      verifyNever(repository.getAllGuestAgeLessThan(age));
      verifyNever(repository.getAllGuestAgeGreaterThan(age));
      verify(repository.getAllGuestAgeEqualTo(age)).called(1);
    });

    test('should not call anything when operator is not support', () async {
      await sut.getAllGuestByAge(age, '*');

      verifyNever(repository.getAllGuestAgeLessThan(age));
      verifyNever(repository.getAllGuestAgeGreaterThan(age));
      verifyNever(repository.getAllGuestAgeEqualTo(age));
    });
  });
}
