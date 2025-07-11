import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic value) {
    return (value as Timestamp).toDate();
  }

  @override
  Timestamp toJson(DateTime fieldValue) => Timestamp.fromDate(fieldValue);
}