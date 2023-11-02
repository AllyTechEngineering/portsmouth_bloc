part of 'centerboard_cubit.dart';

abstract class CenterboardState extends Equatable {}

class InitialState extends CenterboardState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CenterboardState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CenterboardState {
  LoadedState(this.centerboard);

  final List<DataModel> centerboard;

  @override
  List<Object> get props => [centerboard];

  @override
  String toString() {
    return 'LoadedState(centerboard: $centerboard)';
  }
}

class ErrorState extends CenterboardState {
  @override
  List<Object> get props => [];
}
