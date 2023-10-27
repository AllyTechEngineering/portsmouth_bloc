import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portsmouth_bloc/blocs/centerboard/centerboard_cubit.dart';

// import 'package:portsmouth_bloc/blocs/centerboard/centerboard_cubit.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';
import 'package:portsmouth_bloc/models/portsmouth_model.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';

part 'filtered_search_state.dart';

class FilteredSearchCubit extends Cubit<FilteredSearchState> {
  late final StreamSubscription centerboardRepositorySubscription;
  late final StreamSubscription centerboardCubitSubscripton;
  late final StreamSubscription searchCubitSubscription;

  final List<PortsmouthModel> initialData;

  final CenterboardRepository centerboardRepository;
  final CenterboardCubit centerboardCubit;
  final SearchCubit searchCubit;

  FilteredSearchCubit({
    required this.initialData,
    required this.centerboardRepository,
    required this.centerboardCubit,
    required this.searchCubit,
  }) : super(FilteredSearchState(filteredSearchList: initialData)) {
    searchCubitSubscription =
        searchCubit.stream.listen((SearchState searchState) {
      setFilteredList();
    });
  }

  void setFilteredList() {
    print('In setFilteredList');
    List<PortsmouthModel>? _filteredList;
    if (searchCubit.state.searchTerm.isNotEmpty) {
      _filteredList = _filteredList!
          .where((PortsmouthModel portsmouthModel) => portsmouthModel.title
              .toLowerCase()
              .contains(searchCubit.state.searchTerm))
          .toList();
      print('In setFiltered in FilteredCubit if statement: $state');
      emit(state.copyWith(filteredSearchList: _filteredList));
    }
  }

  @override
  Future<void> close() {
    centerboardRepositorySubscription.cancel();
    centerboardCubitSubscripton.cancel();
    searchCubitSubscription.cancel();
    return super.close();
  }
} //class
