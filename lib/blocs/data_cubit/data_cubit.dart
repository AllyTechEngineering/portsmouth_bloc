import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';
import 'package:portsmouth_bloc/blocs/selection/selection_cubit.dart';
// import 'package:portsmouth_bloc/blocs/selection/selection_cubit.dart';
import 'package:portsmouth_bloc/models/data_model.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';

// import '../../models/data_class.dart';
part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  late final StreamSubscription searchCubitSubscription;
  final SearchCubit searchCubit;
  late final StreamSubscription selectionCubitSubscription;
  final SelectionCubit selectionCubit;

  final CenterboardRepository repository;

  DataCubit({required this.repository, required this.searchCubit, required this.selectionCubit})
      : super(InitialState()) {
    selectionCubitSubscription = selectionCubit.stream.listen((SelectionState selectionState) {
      getCenterboardData();
    });
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
      if (selectionCubit.state.selectionClassChoice.name == 'centerboard') {
        final centerboardDataList = await repository.getCenterboard('lib/src/centerboard.json', 'Centerboard');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          debugPrint('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) =>
                  portsmouthModel.boat.toLowerCase().contains(searchCubit.state.searchTerm) ||
                  portsmouthModel.dpn.toLowerCase().contains(searchCubit.state.searchTerm))
              .toList();
          emit(LoadedState(_filteredList));
        } else if (searchCubit.state.searchTerm.isEmpty) {
          emit(LoadedState(centerboardDataList));
        }
      } else if (selectionCubit.state.selectionClassChoice.name == 'keelboat') {
        final centerboardDataList = await repository.getCenterboard('lib/src/keelboat.json', 'Keelboat');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          debugPrint('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) =>
                  portsmouthModel.boat.toLowerCase().contains(searchCubit.state.searchTerm))
              .toList();
          emit(LoadedState(_filteredList));
        } else if (searchCubit.state.searchTerm.isEmpty) {
          emit(LoadedState(centerboardDataList));
        }
      } else if (selectionCubit.state.selectionClassChoice.name == 'multihull') {
        final centerboardDataList = await repository.getCenterboard('lib/src/multihull.json', 'Multihull');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          debugPrint('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) =>
                  portsmouthModel.boat.toLowerCase().contains(searchCubit.state.searchTerm))
              .toList();
          emit(LoadedState(_filteredList));
        } else if (searchCubit.state.searchTerm.isEmpty) {
          emit(LoadedState(centerboardDataList));
        }
      } else if (selectionCubit.state.selectionClassChoice.name == 'offshore') {
        final centerboardDataList = await repository.getCenterboard('lib/src/offshore.json', 'Offshore');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          print('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) =>
                  portsmouthModel.boat.toLowerCase().contains(searchCubit.state.searchTerm))
              .toList();
          emit(LoadedState(_filteredList));
        } else if (searchCubit.state.searchTerm.isEmpty) {
          emit(LoadedState(centerboardDataList));
        }
      }
    } catch (e) {
      emit(ErrorState());
    }
  } //void getCenterboardData()

  @override
  Future<void> close() {
    searchCubitSubscription.cancel();
    selectionCubitSubscription.cancel();
    return super.close();
  }
} //class
