import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';
import 'package:portsmouth_bloc/models/data_model.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';
part 'centerboard_state.dart';

class CenterboardCubit extends Cubit<CenterboardState> {
  late final StreamSubscription searchCubitSubscription;
  final SearchCubit searchCubit;
  final CenterboardRepository repository;

  CenterboardCubit({required this.repository, required this.searchCubit}) : super(InitialState()) {
    searchCubitSubscription = searchCubit.stream.listen((SearchState searchState) {
      getCenterboardData();
    });
    getCenterboardData();
  }
  void getCenterboardData() async {
    List<DataModel> _filteredList;
    try {
      emit(
        LoadingState(),
      );
      final centerboardDataList = await repository.getCenterboard();
      if (searchCubit.state.searchTerm.isNotEmpty) {
        // print('${searchCubit.state.searchTerm}');
        _filteredList = centerboardDataList
            .where((DataModel portsmouthModel) =>
                portsmouthModel.boat.toLowerCase().contains(searchCubit.state.searchTerm))
            .toList();
        emit(LoadedState(_filteredList));
      } else if (searchCubit.state.searchTerm.isEmpty) {
        emit(LoadedState(centerboardDataList));
      }
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
