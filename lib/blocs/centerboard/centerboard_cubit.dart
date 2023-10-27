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
  final CenterboardRepository repository;

  CenterboardCubit({required this.repository, required this.searchCubit})
      : super(InitialState()) {
    searchCubitSubscription =
        searchCubit.stream.listen((SearchState searchState) {
      getCenterboardData(); // not called - not sure why?
    });
    getCenterboardData(); // must have this to get the list loaded.
  }
  void getCenterboardData() async {
    List<PortsmouthModel> _filteredList;
    try {
      emit(
        LoadingState(),
      );
      final centerboardDataList = await repository.getCenterboard();
      if (searchCubit.state.searchTerm.isNotEmpty) {
        // testing shows it nevers enters this.
        _filteredList = centerboardDataList
            .where((PortsmouthModel portsmouthModel) => portsmouthModel.title
                .toLowerCase()
                .contains(searchCubit.state.searchTerm))
            .toList();
        emit(LoadedState(_filteredList));
      } else if (searchCubit.state.searchTerm.isEmpty) {
        // testing shows it does enter this and emit.
        emit(LoadedState(centerboardDataList));
      }
      // emit(LoadedState(centerboardDataList));
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
