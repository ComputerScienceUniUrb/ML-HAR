import 'package:isar/isar.dart';

part 'ar_data.g.dart';

@collection
class ARData {
  Id id = Isar.autoIncrement;

  String? activity;

  String? confidence;

  DateTime? timestamp;
}