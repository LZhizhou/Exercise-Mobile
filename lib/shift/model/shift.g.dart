// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      id: json['id'] as String,
      groupId: json['groupId'] as String,
      position: json['position'] as String,
      subcategory: json['subcategory'] as String,
      experienceLevel: json['experienceLevel'] as int,
      dtstart: json['dtstart'] as String,
      dtend: json['dtend'] as String,
      timezone: json['timezone'] as String,
      unpaidBreakDuration: json['unpaidBreakDuration'] as int,
      locationName: json['locationName'] as String,
      slots: json['slots'] as int,
      attire: json['attire'] as String,
      additionalRequirements: (json['additionalRequirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      additionalInstructions: json['additionalInstructions'] as String,
      taskInstructions: json['taskInstructions'] as String,
      basePrice: json['basePrice'] as int,
      currency: json['currency'] as String,
      pricingType: json['pricingType'] as String,
      bookingFee: json['bookingFee'] as int,
      markupFee: json['markupFee'] as int,
      priceCeiling: json['priceCeiling'] as int,
      invoiceId: json['invoiceId'] as String,
      openAvailability: json['openAvailability'] as bool,
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      proRequests: (json['proRequests'] as List<dynamic>)
          .map((e) => Pro.fromJson(e as Map<String, dynamic>))
          .toList(),
      matched: (json['matched'] as List<dynamic>)
          .map((e) => Matched.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchingGroup: json['matchingGroup'] as String?,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      availableSlots: json['availableSlots'] as int,
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'position': instance.position,
      'subcategory': instance.subcategory,
      'experienceLevel': instance.experienceLevel,
      'dtstart': instance.dtstart.toIso8601String(),
      'dtend': instance.dtend.toIso8601String(),
      'timezone': instance.timezone,
      'unpaidBreakDuration': instance.unpaidBreakDuration,
      'locationName': instance.locationName,
      'slots': instance.slots,
      'attire': instance.attire,
      'additionalRequirements': instance.additionalRequirements,
      'additionalInstructions': instance.additionalInstructions,
      'taskInstructions': instance.taskInstructions,
      'basePrice': instance.basePrice,
      'currency': instance.currency,
      'pricingType': instance.pricingType,
      'bookingFee': instance.bookingFee,
      'markupFee': instance.markupFee,
      'priceCeiling': instance.priceCeiling,
      'invoiceId': instance.invoiceId,
      'openAvailability': instance.openAvailability,
      'contacts': instance.contacts.map((e) => e.toJson()).toList(),
      'proRequests': instance.proRequests.map((e) => e.toJson()).toList(),
      'matched': instance.matched.map((e) => e.toJson()).toList(),
      'matchingGroup': instance.matchingGroup,
      'location': instance.location.toJson(),
      'availableSlots': instance.availableSlots,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      name: json['name'] as String,
      phone: json['phone'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'createdAt': instance.createdAt.toIso8601String(),
    };

Pro _$ProFromJson(Map<String, dynamic> json) => Pro(
      id: json['id'] as String,
      avatar: json['avatar'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ProToJson(Pro instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

Matched _$MatchedFromJson(Map<String, dynamic> json) => Matched(
      id: json['id'] as String,
      shiftId: json['shiftId'] as String,
      proId: json['proId'] as String,
      currency: json['currency'] as String,
      orgPay: json['orgPay'] as int,
      cancelledAt: json['cancelledAt'] as String?,
      proCancelledAt: json['proCancelledAt'] as String?,
      attendanceSource: json['attendanceSource'] as String?,
      dtstart: DateTime.parse(json['dtstart'] as String),
      dtend: DateTime.parse(json['dtend'] as String),
      pro: Pro.fromJson(json['pro'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$MatchedToJson(Matched instance) => <String, dynamic>{
      'id': instance.id,
      'shiftId': instance.shiftId,
      'proId': instance.proId,
      'currency': instance.currency,
      'orgPay': instance.orgPay,
      'cancelledAt': instance.cancelledAt,
      'proCancelledAt': instance.proCancelledAt,
      'attendanceSource': instance.attendanceSource,
      'dtstart': instance.dtstart.toIso8601String(),
      'dtend': instance.dtend.toIso8601String(),
      'pro': instance.pro.toJson(),
      'status': instance.status,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String,
      address: json['address'] as String,
      parkingType: json['parkingType'] as String,
      locationInstructions: json['locationInstructions'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      locality: json['locality'] as String,
      country: json['country'] as String,
      administrativeAreaLevelOne: json['administrativeAreaLevelOne'] as String,
      administrativeAreaLevelTwo: json['administrativeAreaLevelTwo'] as String,
      administrativeAreaLevelThree:
          json['administrativeAreaLevelThree'] as String,
      postalCode: json['postalCode'] as String,
      timezone: json['timezone'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'parkingType': instance.parkingType,
      'locationInstructions': instance.locationInstructions,
      'lat': instance.lat,
      'lon': instance.lon,
      'locality': instance.locality,
      'country': instance.country,
      'administrativeAreaLevelOne': instance.administrativeAreaLevelOne,
      'administrativeAreaLevelTwo': instance.administrativeAreaLevelTwo,
      'administrativeAreaLevelThree': instance.administrativeAreaLevelThree,
      'postalCode': instance.postalCode,
      'timezone': instance.timezone,
      'createdAt': instance.createdAt.toIso8601String(),
    };
