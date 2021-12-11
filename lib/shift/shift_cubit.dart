import 'package:bloc/bloc.dart';

import 'shift.dart';
import 'shift_state.dart';

class ShiftsCubit extends Cubit<ShiftsState> {
  final ShiftRepository _shiftRepository;

  ShiftsCubit(this._shiftRepository) : super( ShiftsInitial()){
    fetchShift();
  }

  Future<void> fetchShift() async {
    try {
      emit(ShiftsLoading());
      final shifts = await _shiftRepository.fetchShifts();
      emit(ShiftsLoaded(shifts));
    } on NetworkException {
      emit(ShiftsError("Couldn't fetch shifts. Is the device online?"));
    }
  }
}
