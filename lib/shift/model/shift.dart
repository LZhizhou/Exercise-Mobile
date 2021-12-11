import 'dart:convert';

import 'package:exercise_mobile/tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:timezone/timezone.dart' as tz;

part 'shift.g.dart';

@JsonSerializable()
class Shift {
  Shift({
    required this.id,
    required this.groupId,
    required this.position,
    required this.subcategory,
    required this.experienceLevel,
    required String dtstart,
    required String dtend,
    required this.timezone,
    required this.unpaidBreakDuration,
    required this.locationName,
    required this.slots,
    required this.attire,
    required this.additionalRequirements,
    required this.additionalInstructions,
    required this.taskInstructions,
    required this.basePrice,
    required this.currency,
    required this.pricingType,
    required this.bookingFee,
    required this.markupFee,
    required this.priceCeiling,
    required this.invoiceId,
    required this.openAvailability,
    required this.contacts,
    required this.proRequests,
    required this.matched,
    required this.matchingGroup,
    required this.location,
    required this.availableSlots,
  })  : dtstart = tz.TZDateTime.from(
          DateTime.parse(dtstart),
          tz.getLocation(timezone),
        ),
        dtend =
            tz.TZDateTime.from(DateTime.parse(dtend), tz.getLocation(timezone));
  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
  Map<String, dynamic> toJson() => _$ShiftToJson(this);
  String id;
  String groupId;
  String position;
  String subcategory;
  int experienceLevel;
  DateTime dtstart;
  DateTime dtend;
  String timezone;
  int unpaidBreakDuration;
  String locationName;
  int slots;
  String attire;
  List<String> additionalRequirements;
  String additionalInstructions;
  String taskInstructions;
  int basePrice;
  String currency;
  String pricingType;
  int bookingFee;
  int markupFee;
  int priceCeiling;
  String invoiceId;
  bool openAvailability;
  List<Contact> contacts;
  List<Pro> proRequests;
  List<Matched> matched;
  String? matchingGroup;
  Location location;
  int availableSlots;
  static Future<List<Shift>> fetchShifts() async {
    final response = await http.get(
      Uri.parse(
        'https://099f998e-8348-4d04-83b6-891462df8f52.mock.pstmn.io/shifts',
      ),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ((jsonDecode(response.body) as Map<String, dynamic>)['data']
              as List<dynamic>)
          .map((dynamic e) => Shift.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw NetworkException();
      // return [];
    }
  }

  String get fillInfo {
    if (slots == 0) {
      return '';
    }
    final open = slots - matched.length;
    return '${matched.length} Filled${open > 0 ? " • $open Open" : ''}';
  }

  String get title => '$slots $position'.replaceAll('-', ' ').toTitleCase();
  String get date =>
      "${(dtstart.date == DateTime.now().date) ? "Today - " : ""}"
      "${DateFormat("EEEE, MMM d").format(dtstart).toUpperCase()}";
  String get time =>
      '${DateFormat.jm().format(dtstart)} - ${DateFormat.jm().format(dtend)}';
  String get unpaidBreak => '$unpaidBreakDuration minutes';
  String get rate => '${(basePrice / 100.00).toStringAsFixed(2)} / hour';
}

class NetworkException implements Exception {}

@JsonSerializable()
class Contact {
  Contact({required this.name, required this.phone, required this.createdAt});
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
  String name;
  String phone;
  DateTime createdAt;
}

@JsonSerializable()
class Pro {
  Pro({
    required this.id,
    required this.avatar,
    required this.firstName,
    required this.lastName,
  });
  factory Pro.fromJson(Map<String, dynamic> json) => _$ProFromJson(json);
  Map<String, dynamic> toJson() => _$ProToJson(this);
  String id;
  String? avatar;
  String firstName;
  String lastName;
}

@JsonSerializable()
class Matched {
  Matched({
    required this.id,
    required this.shiftId,
    required this.proId,
    required this.currency,
    required this.orgPay,
    required this.cancelledAt,
    required this.proCancelledAt,
    required this.attendanceSource,
    required this.dtstart,
    required this.dtend,
    required this.pro,
    required this.status,
  });
  factory Matched.fromJson(Map<String, dynamic> json) =>
      _$MatchedFromJson(json);
  Map<String, dynamic> toJson() => _$MatchedToJson(this);
  String id;
  String shiftId;
  String proId;
  String currency;
  int orgPay;
  String? cancelledAt;
  String? proCancelledAt;
  String? attendanceSource;
  DateTime dtstart;
  DateTime dtend;
  Pro pro;
  String status;
}

@JsonSerializable()
class Location {
  Location({
    required this.name,
    required this.address,
    required this.parkingType,
    required this.locationInstructions,
    required this.lat,
    required this.lon,
    required this.locality,
    required this.country,
    required this.administrativeAreaLevelOne,
    required this.administrativeAreaLevelTwo,
    required this.administrativeAreaLevelThree,
    required this.postalCode,
    required this.timezone,
    required this.createdAt,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
  String name;
  String address;
  String parkingType;
  String locationInstructions;
  double lat;
  double lon;
  String locality;
  String country;
  String administrativeAreaLevelOne;
  String administrativeAreaLevelTwo;
  String administrativeAreaLevelThree;
  String postalCode;
  String timezone;
  DateTime createdAt;
}
