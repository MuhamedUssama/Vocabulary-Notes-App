import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vocabulary_notes_app/constants/hive_constant.dart';
import 'package:vocabulary_notes_app/controllers/read_data_cubit/read_data_cubit_state.dart';

class ReadDataCubit extends Cubit<ReadDataCubitStates> {
  static get(context) => BlocProvider.of(context);
  ReadDataCubit() : super(ReadDataCubitInitialState());

  final Box _box = Hive.box(HiveContants.wordBox);

  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortedBy sortedBy = SortedBy.time;
  SortingType sortingType = SortingType.decending;

  void updateLanguageFilter(LanguageFilter languageFilter) {
    this.languageFilter = languageFilter;
  }

  void updateSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
  }

  void updateSortingType(SortingType sortingType) {
    this.sortingType = sortingType;
  }
}

enum LanguageFilter {
  arabicOnly,
  englishOnly,
  allWords,
}

enum SortedBy {
  time,
  wordLength,
}

enum SortingType {
  ascending,
  decending,
}
