import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portsmouth_bloc/models/portsmouth_model.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';

part 'centerboard_state.dart';

class CenterboardCubit extends Cubit<CenterboardState> {
  CenterboardCubit({required this.repository}) : super(InitialState()) {
    getCenterboardData();
  }

  final CenterboardRepository repository;

  void getCenterboardData() async {
    try {
      emit(LoadingState());
      final centerboardDataList = await repository.getCenterboard();
      emit(LoadedState(centerboardDataList!));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
