import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filtered_state.dart';

class FilteredCubit extends Cubit<FilteredState> {
  FilteredCubit() : super(FilteredInitial());
}
