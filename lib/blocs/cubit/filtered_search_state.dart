part of 'filtered_search_cubit.dart';

class FilteredSearchState extends Equatable {
  final List<PortsmouthModel> filteredSearchList;
  FilteredSearchState({
    required this.filteredSearchList,
  });

factory FilteredSearchState.initial(){
  return FilteredSearchState(filteredSearchList: []);
}

  @override
  List<Object> get props => [filteredSearchList];

  @override
  String toString() => 'FilteredSearchState(filteredSearchList: $filteredSearchList)';

  FilteredSearchState copyWith({
    List<PortsmouthModel>? filteredSearchList,
  }) {
    return FilteredSearchState(
      filteredSearchList: filteredSearchList ?? this.filteredSearchList,
    );
  }
}
