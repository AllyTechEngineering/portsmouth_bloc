import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';
import 'package:portsmouth_bloc/blocs/selection/selection_cubit.dart';
// import 'package:portsmouth_bloc/blocs/selection/selection_cubit.dart';
import 'package:portsmouth_bloc/models/data_model.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';
part 'data_state.dart';

/*
    selectionCubitSubscription =
        selectionCubit.stream.listen((SelectionState selectionState) {
      print(
          'Should be the class type: ${selectionState.selectionClassChoice.name}');
    });
*/
class DataCubit extends Cubit<DataState> {
  late final StreamSubscription searchCubitSubscription;
  final SearchCubit searchCubit;
  late final StreamSubscription selectionCubitSubscription;
  final SelectionCubit selectionCubit;

  final CenterboardRepository repository;
  // print(
  //       'Should be the class type: ${selectionState.selectionClassChoice.name}');
  DataCubit(
      {required this.repository,
      required this.searchCubit,
      required this.selectionCubit})
      : super(InitialState()) {
    selectionCubitSubscription =
        selectionCubit.stream.listen((SelectionState selectionState) {
      getCenterboardData();
    });
    searchCubitSubscription =
        searchCubit.stream.listen((SearchState searchState) {
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
      //       - 'lib/src/centerboard.json'
      // - lib/src/keelboat.json
      // - lib/src/multihull.json
      // - lib/src/offshore.json
      if (selectionCubit.state.selectionClassChoice.name == 'centerboard') {
        final centerboardDataList =
            await repository.getCenterboard('lib/src/centerboard.json');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          print('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) => portsmouthModel.boat
                  .toLowerCase()
                  .contains(searchCubit.state.searchTerm))
              .toList();
          emit(LoadedState(_filteredList));
        } else if (searchCubit.state.searchTerm.isEmpty) {
          emit(LoadedState(centerboardDataList));
        }
      } else if (selectionCubit.state.selectionClassChoice.name == 'keelboat') {
        final centerboardDataList =
            await repository.getCenterboard('lib/src/keelboat.json');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          print('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) => portsmouthModel.boat
                  .toLowerCase()
                  .contains(searchCubit.state.searchTerm))
              .toList();
          emit(LoadedState(_filteredList));
        } else if (searchCubit.state.searchTerm.isEmpty) {
          emit(LoadedState(centerboardDataList));
        }
      } else if (selectionCubit.state.selectionClassChoice.name ==
          'multihull') {
        final centerboardDataList =
            await repository.getCenterboard('lib/src/multihull.json');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          print('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) => portsmouthModel.boat
                  .toLowerCase()
                  .contains(searchCubit.state.searchTerm))
              .toList();
          emit(LoadedState(_filteredList));
        } else if (searchCubit.state.searchTerm.isEmpty) {
          emit(LoadedState(centerboardDataList));
        }
      } else if (selectionCubit.state.selectionClassChoice.name == 'offshore') {
        final centerboardDataList =
            await repository.getCenterboard('lib/src/offshore.json');
        if (searchCubit.state.searchTerm.isNotEmpty) {
          print('${searchCubit.state.searchTerm}');
          _filteredList = centerboardDataList
              .where((DataModel portsmouthModel) => portsmouthModel.boat
                  .toLowerCase()
                  .contains(searchCubit.state.searchTerm))
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
