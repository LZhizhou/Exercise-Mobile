import 'package:bloc/bloc.dart';
import 'package:exercise_mobile/shift/model/shift.dart';
import 'package:exercise_mobile/shift/model/shift_state.dart';

class ShiftCubit extends Cubit<ShiftsState> {
  ShiftCubit() : super(const ShiftsInitial());
  ShiftCubit.autoFetch() : super(const ShiftsInitial()) {
    fetchShift();
  }

  Future<void> fetchShift() async {
    try {
      emit(const ShiftsLoading());
      final shifts = await Shift.fetchShifts();
      emit(ShiftsLoaded(shifts));
    } on NetworkException {
      emit(const ShiftsError("Couldn't fetch shifts. Is the device online?"));
    }
  }
}
