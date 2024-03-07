import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vocabulary_notes_app/constants/hive_constant.dart';
import 'package:vocabulary_notes_app/controllers/read_data_cubit/read_data_cubit_state.dart';
import 'package:vocabulary_notes_app/models/word_model.dart';

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

  void getWords() {
    emit(ReadDataCubitLoadingState());
    try {
      List<WordModel> wordToReturn =
          List.from(_box.get(HiveContants.wordList, defaultValue: []))
              .cast<WordModel>();
      _removeUnwantedWords(wordToReturn);
    } catch (error) {
      emit(ReadDataCubitFailedState(
          message: "We have an issue, please try again"));
    }
  }

  void _removeUnwantedWords(List<WordModel> wordToReturn) {
    if (languageFilter == LanguageFilter.allWords) {
      return;
    }

    for (int i = 0; i < wordToReturn.length; i++) {
      if ((languageFilter == LanguageFilter.arabicOnly &&
              wordToReturn[i].isArabic == false) ||
          (languageFilter == LanguageFilter.englishOnly &&
              wordToReturn[i].isArabic == true)) {
        wordToReturn.removeAt(i);
        i--;
      }
    }
  }

  void _applySortingBy(List<WordModel> wordToReturn) {
    if (sortedBy == SortedBy.time) {
      if (sortingType == SortingType.ascending) {
        return;
      } else {
        _reverse(wordToReturn);
      }
    } else {}
  }

  void _reverse(List<WordModel> wordToReturn) {
    for (int i = 0; i < wordToReturn.length / 2; i++) {
      WordModel temp = wordToReturn[i];
      wordToReturn[i] = wordToReturn[wordToReturn.length - 1 - i];
      wordToReturn[wordToReturn.length - 1 - i] = temp;
    }
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
