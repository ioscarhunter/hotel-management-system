import 'package:hotel_management_system/presenter/hotel_system.dart';
import 'package:hotel_management_system/repository/file_repository.dart';

class Interpreter {
  Interpreter(this.hotel, this.fileReader);

  final HotelSystem hotel;
  final FileRepository fileReader;

  Future<void> readFromFileAndExecuteCommands(Uri uri) {
    return fileReader.readAsLines(uri).then(executeCommands);
  }

  void executeCommands(List<List<String>> commands) {
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
        return hotel.checkOutByFloor(command[1]);
      case 'book_by_floor':
        return hotel.checkInByFloor(command[1], command[2], int.parse(command[3]));
      default:
        return Future.value('Command not found: ${command[0]}');
    }
  }
}
