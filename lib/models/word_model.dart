class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel addExapmle(bool isArabicExapmle, String example) {
    List<String> newExamples = _checkIfArabicExampleOrNot(isArabicExapmle);

    newExamples.add(example);

    return _getWordAfterCheckExamples(isArabicExapmle, newExamples);
  }

  WordModel deleteExample(int indexOfExample, bool isArabicExapmle) {
    List<String> newExamples = _checkIfArabicExampleOrNot(isArabicExapmle);

    newExamples.removeAt(indexOfExample);

    return _getWordAfterCheckExamples(isArabicExapmle, newExamples);
  }

  WordModel addSimilarWord(String similarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords =
        _checkIfArabicSimilarWord(isArabicSimilarWord);

    newSimilarWords.add(similarWord);

    return _getWordAfterCheckSimilarWord(newSimilarWords, isArabicSimilarWord);
  }

  WordModel deleteSimilarWord(
      int indexOfSimilarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords =
        _checkIfArabicSimilarWord(isArabicSimilarWord);

    newSimilarWords.removeAt(indexOfSimilarWord);

    return _getWordAfterCheckSimilarWord(newSimilarWords, isArabicSimilarWord);
  }

  List<String> _checkIfArabicSimilarWord(bool isArabicSimilarWord) {
    if (isArabicSimilarWord) {
      return List.from(arabicSimilarWords);
    } else {
      return List.from(englishSimilarWords);
    }
  }

  WordModel _getWordAfterCheckSimilarWord(
      List<String> newSimilarWords, bool isArabicSimilarWord) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords:
          isArabicSimilarWord ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords:
          isArabicSimilarWord ? englishSimilarWords : newSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  List<String> _checkIfArabicExampleOrNot(bool isArabicExapmle) {
    if (isArabicExapmle) {
      return List.from(arabicExamples);
    } else {
      return List.from(englishExamples);
    }
  }

  WordModel _getWordAfterCheckExamples(
      bool isArabicExapmle, List<String> newExamples) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: isArabicExapmle ? newExamples : arabicExamples,
      englishExamples: !isArabicExapmle ? newExamples : englishExamples,
    );
  }
}
