import 'dart:io';

import 'package:isar/isar.dart';

class LocalDataService {
  LocalDataService() {
    _initIsar();
  }

  static const _name = 'LocalData';

  late Isar _isar;

  Isar get isar => _isar;

  final List<CollectionSchema> schemas = [];

  Future<void> _initIsar() async {
    _isar = await Isar.open(schemas, directory: Directory.current.path, name: _name);
  }
}
