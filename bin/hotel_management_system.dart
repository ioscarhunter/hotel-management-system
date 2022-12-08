import 'dart:io';

import 'package:hotel_management_system/presenter/hotel_system.dart';
import 'package:hotel_management_system/presenter/interpreter.dart';
import 'package:hotel_management_system/repository/booking_data_repository.dart';
import 'package:hotel_management_system/repository/booking_repository.dart';
import 'package:hotel_management_system/repository/file_repository.dart';
import 'package:hotel_management_system/service/file_reader_service.dart';
import 'package:hotel_management_system/service/local_data_service.dart';

void main(List<String> arguments) async {
  final LocalDataService localDataService = LocalDataService();
  final BookingDataRepository dataRepository = BookingDataRepository(localDataService);
  final BookingRepository repository = BookingRepository(dataRepository);

  final FileReaderService fileReaderService = FileReaderService();
  final FileRepository fileRepository = FileRepository(fileReaderService);

  final HotelSystem hotel = HotelSystem(repository);
  final Interpreter interpreter = Interpreter(hotel, fileRepository);

  await localDataService.initIsar();

  await dataRepository.clearData();

  await interpreter.readFromFileAndExecuteCommands(Uri.file('${Directory.current.path}/input.txt'));
}
