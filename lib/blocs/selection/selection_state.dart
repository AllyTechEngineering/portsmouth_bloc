part of 'selection_cubit.dart';

class SelectionState extends Equatable {
  final SelectionModel selectionChoice;
  SelectionState({
    required this.selectionChoice,
  });

  factory SelectionState.initial() {
    return SelectionState(selectionChoice: SelectionModel.centerboard);
  }

  @override
  List<Object> get props => [selectionChoice];

  @override
  String toString() => 'SelectionState(selectionChoice: $selectionChoice)';

  SelectionState copyWith({
    SelectionModel? selectionChoice,
  }) {
    return SelectionState(
      selectionChoice: selectionChoice ?? this.selectionChoice,
    );
  }
}
