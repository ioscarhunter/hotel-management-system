import 'package:hotel_management_system/entity/key_card.dart';
import 'package:hotel_management_system/entity/room.dart';
import 'package:hotel_management_system/repository/booking_data_repository.dart';
import 'package:hotel_management_system/service/local_data_service.dart';

void main(List<String> arguments) async {
  final LocalDataService localDataService = LocalDataService();
  final BookingDataRepository dataRepository = BookingDataRepository(localDataService);

  await localDataService.initIsar();

  await dataRepository.clearData();
}

class Hotel {
  Hotel(this.dataRepository);

  final BookingDataRepository dataRepository;

  Future<void> initHotel(int floorCount, int roomPerFloorCount) {
    final List<Room> rooms = [];
    for (int floor = 1; floor <= floorCount; floor++) {
      for (int room = 1; room <= roomPerFloorCount; room++) {
        rooms.add(Room('$room', '$floor'));
      }
    }

    List<KeyCard> keyCards = [];

    for (int cardName = 1; cardName <= floorCount * roomPerFloorCount; cardName++) {
      keyCards.add(KeyCard('$cardName'));
    }

    return Future.wait([dataRepository.createRoom(rooms), dataRepository.createKeyCard(keyCards)]);
  }
}
