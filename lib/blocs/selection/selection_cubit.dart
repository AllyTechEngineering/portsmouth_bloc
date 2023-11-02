import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portsmouth_bloc/models/selection_model.dart';

part 'selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionState.initial());

  void setSelectionChoice(SelectionModel newSelectionChoice) {
    print(
        'Inside of SelectionCubit and watching selection choice: $newSelectionChoice');
    emit(state.copyWith(selectionChoice: newSelectionChoice));
  }
}
