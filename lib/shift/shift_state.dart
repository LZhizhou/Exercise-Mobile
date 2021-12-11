import 'package:exercise_mobile/tool.dart';
import 'package:flutter/cupertino.dart';

import 'shift.dart';
import 'package:collection/collection.dart';

abstract class ShiftsState {
  const ShiftsState();
}

class ShiftsInitial extends ShiftsState {
  const ShiftsInitial();
}

class ShiftsLoading extends ShiftsState {
  const ShiftsLoading();
}

@immutable
class ShiftsLoaded extends ShiftsState {
  final List<Shift> shifts;
  const ShiftsLoaded(this.shifts);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ShiftsLoaded &&
        const DeepCollectionEquality.unordered().equals(shifts, other.shifts);
  }

  Map<DateTime, List<Shift>>  groupFoldByDay() {
    return shifts
        // .where((element) => element.dtstart.compareTo(DateTime.now()) >= 0)
        .groupFoldBy<DateTime, List<Shift>>(
            (Shift element) => element.dtstart.date,
            (List<Shift>? previous, Shift element) => [...?previous, element]);
  }

  @override
  int get hashCode => shifts.hashCode;
}

@immutable
class ShiftsError extends ShiftsState {
  final String message;
  const ShiftsError(this.message);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ShiftsError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
