import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  void setSearchTerm(String newSearchTerm) {
    // print('In SearchCubit setSearchTerm: $newSearchTerm');
    emit(state.copyWith(searchTerm: newSearchTerm));
    newSearchTerm = '';
  }
}
