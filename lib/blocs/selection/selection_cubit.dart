import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionState.initial());
  void setSelectionClassChoice(String selectionChoice) {
    // print('Initial selectionChoice is: ${selectionChoice}');
    if (selectionChoice == SelectionClassChoice.centerboard.name) {
      // print('In first if printing selectionChoice: ${state.selectionClassChoice}');
      emit(state.copyWith(
          selectionClassChoice: SelectionClassChoice.centerboard));
    } else if (selectionChoice == SelectionClassChoice.keelboat.name) {
      // print('In first else if printing selectionChoice: ${state.selectionClassChoice}');
            emit(state.copyWith(
          selectionClassChoice: SelectionClassChoice.keelboat));
    } else if (selectionChoice == SelectionClassChoice.multihull.name) {
      // print('In second else if printing selectionChoice: ${state.selectionClassChoice}');
            emit(state.copyWith(
          selectionClassChoice: SelectionClassChoice.multihull));
    } else if (selectionChoice == SelectionClassChoice.offshore.name) {
      // print('In third else if printing selectionChoice: ${state.selectionClassChoice}');
            emit(state.copyWith(
          selectionClassChoice: SelectionClassChoice.offshore));
    } else {
      // print('Missed all of the if and else if');
    }
  }
}
