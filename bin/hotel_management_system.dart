import 'dart:io';

import 'package:hotel_management_system/entity/guest.dart';
import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/repository/booking_data_repository.dart';
import 'package:hotel_management_system/repository/booking_repository.dart';
import 'package:hotel_management_system/service/local_data_service.dart';

import 'list_extension.dart';

void main(List<String> arguments) async {
  final LocalDataService localDataService = LocalDataService();
  final BookingDataRepository dataRepository = BookingDataRepository(localDataService);
  final BookingRepository repository = BookingRepository(dataRepository);

  final Hotel hotel = Hotel(repository);
  final FileReader fileReader = FileReader();
  final Interpreter interpreter = Interpreter(hotel, fileReader);

  await localDataService.initIsar();

  await dataRepository.clearData();

  await interpreter.readFromFileAndExecuteCommands(Directory.current.path + '\\input.txt');
}

class Hotel {
  Hotel(this.repository);

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
}

class Interpreter {
  Interpreter(this.hotel, this.fileReader);

  final Hotel hotel;
  final FileReader fileReader;

  Future<void> readFromFileAndExecuteCommands(String path) {
    return fileReader.readFile(path).then(executeCommands);
  }

  void executeCommands(List<String> lines) {
    final List<List<String>> commands = lines.map((line) => line.split(' ')).toList();
    try {
      Future.forEach(commands, (command) async => await executeCommand(command));
    } catch (exception) {
      print(exception.toString());
    }
  }

  Future<void> executeCommand(List<String> command) async {
    try {
      print(await convertCommand(command));
    } catch (exception) {
      if (exception is CastError) {
        print('Data not found');
      } else if (exception is RangeError) {
        print('Command argument not valid');
      } else {
        print(exception.toString());
      }
    }
  }

  Future<String> convertCommand(List<String> command) {
    switch (command[0]) {
      case 'create_hotel':
        return hotel.initHotel(int.parse(command[1]), int.parse(command[2]));
      case 'book':
        return hotel.checkIn(command[2], int.parse(command[3]), command[1]);
      case 'list_available_rooms':
        return hotel.getAvailableRoom();
      case 'checkout':
        return hotel.checkout(command[2], command[1]);
      case 'list_guest':
        return hotel.getAllGuest();
      case 'get_guest_in_room':
        return hotel.getGuestByRoom(command[1]);
      case 'list_guest_by_age':
        return hotel.getAllGuestByAge(int.parse(command[2]), command[1]);
      case 'list_guest_by_floor':
        return hotel.getAllGuestByFloor(command[1]);
      case 'checkout_guest_by_floor':

      case 'book_by_floor':

      default:
        return Future.value('Command not found: ${command[0]}');
    }
  }
}

class FileReader {
  Future<List<String>> readFile(String path) async {
    final File file = File(path);

    return file.readAsLines();
  }
}
