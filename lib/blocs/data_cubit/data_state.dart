part of 'data_cubit.dart';

abstract class DataState extends Equatable {}

class InitialState extends DataState {
  @override
  List<Object> get props => [];
}

class LoadingState extends DataState {
  @override
  List<Object> get props => [];
}

class LoadedState extends DataState {
  LoadedState(this.centerboard);

  final List<DataModel> centerboard;

  @override
  List<Object> get props => [centerboard];

  @override
  String toString() {
    return 'LoadedState(centerboard: $centerboard)';
  }
}

class ErrorState extends DataState {
  @override
  List<Object> get props => [];
}
