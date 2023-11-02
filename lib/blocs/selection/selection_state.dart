part of 'selection_cubit.dart';

enum SelectionClassChoice {
  centerboard,
  keelboat,
  multihull,
  offshore,
}

class SelectionState extends Equatable {
  final SelectionClassChoice selectionClassChoice;
  SelectionState({
    this.selectionClassChoice = SelectionClassChoice.centerboard,
  });
  factory SelectionState.initial() {
    return SelectionState();
  }
  @override
  List<Object> get props => [selectionClassChoice];

  @override
  String toString() =>
      'SelectionState(selectionClassChoice: $selectionClassChoice)';

  SelectionState copyWith({
    SelectionClassChoice? selectionClassChoice,
  }) {
    return SelectionState(
      selectionClassChoice: selectionClassChoice ?? this.selectionClassChoice,
    );
  }
}
