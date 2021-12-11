import 'package:collection/collection.dart';
import 'package:exercise_mobile/shift/model/shift.dart';
import 'package:exercise_mobile/tool.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ShiftsState {
  const ShiftsState();
  @override
  bool operator ==(Object other) => other is ShiftsState;

  @override
  int get hashCode => 'ShiftsState'.hashCode;
}

@immutable
class ShiftsInitial extends ShiftsState {
  const ShiftsInitial();
  @override
  bool operator ==(Object other) => other is ShiftsInitial;
  @override
  int get hashCode => 'ShiftsInitial'.hashCode;
}

@immutable
class ShiftsLoading extends ShiftsState {
  const ShiftsLoading();
  @override
  bool operator ==(Object other) => other is ShiftsLoading;
  @override
  int get hashCode => 'ShiftsLoading'.hashCode;
}

@immutable
class ShiftsLoaded extends ShiftsState {
  const ShiftsLoaded(this.shifts);
  final List<Shift> shifts;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ShiftsLoaded &&
        const DeepCollectionEquality.unordered().equals(shifts, other.shifts);
  }

  Map<DateTime, List<Shift>> groupFoldByDay() {
    return shifts
        // .where((element) => element.dtstart.compareTo(DateTime.now()) >= 0)
        .groupFoldBy<DateTime, List<Shift>>(
      (Shift element) => element.dtstart.date,
      (List<Shift>? previous, Shift element) => [...?previous, element],
    );
  }

  @override
  int get hashCode => shifts.hashCode;
}

@immutable
class ShiftsError extends ShiftsState {
  const ShiftsError(this.message);
  final String message;
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
