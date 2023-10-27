import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';
import 'package:portsmouth_bloc/models/portsmouth_model.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';

part 'centerboard_state.dart';

class CenterboardCubit extends Cubit<CenterboardState> {
  late final StreamSubscription searchCubitSubscription;
  final SearchCubit searchCubit;

  CenterboardCubit({required this.repository, required this.searchCubit})
      : super(InitialState()) {
    searchCubitSubscription =
        searchCubit.stream.listen((SearchState searchState) {
      getCenterboardData();
    });
    getCenterboardData();
  }

  final CenterboardRepository repository;

  void getCenterboardData() async {
    try {
      emit(
        LoadingState(),
      );
      final centerboardDataList = await repository.getCenterboard();

      emit(LoadedState(centerboardDataList));
    } catch (e) {
      emit(ErrorState());
    }
  } //void getCenterboardData()

  @override
  Future<void> close() {
    searchCubitSubscription.cancel();
    return super.close();
  }
} //class
